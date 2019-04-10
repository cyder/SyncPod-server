class RoomChannel < ApplicationCable::Channel
  attr_reader :uuid

  def subscribed
    @room = Room.find_by(key: params[:room_key])
    return reject if @room.blank?

    @uuid = SecureRandom.uuid
    if current_user.present?
      return reject if @room.banned?(current_user)
      @room.enter(current_user, @uuid)
    end

    stream_for @uuid
    stream_from "room_#{@room.id}"
  end

  def unsubscribed
    # 既に強制退出されているときは退出処理を行わない
    return if @room.blank? || @room.banned?(current_user)
    @room.exit(@uuid)
  end

  def now_playing_video
    RoomChannel.broadcast_to @uuid,
                             render_now_playing_video_json(@room)
  end

  def play_list
    RoomChannel.broadcast_to @uuid,
                             render_play_list_json(@room)
  end

  def past_chats
    RoomChannel.broadcast_to @uuid,
                             render_past_chats_json(@room)
  end

  def add_video(data)
    return if current_user.blank?

    video = @room.add_video(data["youtube_video_id"], current_user)
    return video if video.blank?
    add_message = video.add_user.name + "さんが「" + video.title + "」を追加しました。"
    Chat.create! room: video.room,
                 chat_type: "add_video",
                 message: add_message
    start_message = "「" + video.title + "」の再生を開始しました。"
    MessageReservationJob.set(wait_until: video.video_start_time).perform_later("start_video", start_message, video.room)
  end

  def exit_force(data)
    return if current_user.blank?

    target = User.find(data["user_id"])
    logs = @room.online_user_room_logs.where(user: target)
    logs.each do |log|
      RoomChannel.broadcast_to log.uuid,
                               render_error_json("force exit")
      @room.exit(log.uuid)
    end
    BanReport.create! target: target,
                      reporter: current_user,
                      room: @room,
                      expiration_at: Time.now.utc + 60 * 60 * 24
  end

  def message(data)
    return if current_user.blank?

    Chat.create! room: @room,
                 chat_type: "user",
                 message: data["message"],
                 user: current_user
  end

  private

    def render_now_playing_video_json(room)
      ApplicationController.renderer.render("jbuilder/now_playing_video",
                                            formats: "json",
                                            handlers: "jbuilder",
                                            locals: { video: room.now_playing_video })
    end

    def render_play_list_json(room)
      ApplicationController.renderer.render("jbuilder/play_list",
                                            formats: "json",
                                            handlers: "jbuilder",
                                            locals: { videos: room.play_list })
    end

    def render_past_chats_json(room)
      ApplicationController.renderer.render("jbuilder/past_chats",
                                            formats: "json",
                                            handlers: "jbuilder",
                                            locals: { chats: room.past_chats(10) })
    end

    def render_error_json(message)
      ApplicationController.renderer.render("jbuilder/error",
                                            formats: "json",
                                            handlers: "jbuilder",
                                            locals: { message: message })
    end
end
