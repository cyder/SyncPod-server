class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    @room = Room.find_by(key: params[:room_key])
    stream_from "room_#{@room.id}"
    message = current_user.name + "さんが入室しました。"
    Chat.create! room: @room, chat_type: "login", message: message
    UserRoomLog.create! user: current_user, room: @room, entry_at: Time.now.utc
  end

  def unsubscribed
    message = current_user.name + "さんが退室しました。"
    Chat.create! room: @room, chat_type: "logout", message: message
    UserRoomLog.find_by!(user: current_user, room: @room, exit_at: nil).update(exit_at: Time.now.utc)
  end

  def now_playing_video
    RoomChannel.broadcast_to current_user,
                             render_now_playing_video_json(@room)
  end

  def play_list
    RoomChannel.broadcast_to current_user,
                             render_play_list_json(@room)
  end

  def past_chats
    RoomChannel.broadcast_to current_user,
                             render_past_chats_json(@room)
  end

  def add_video(data)
    video = @room.add_video(data["youtube_video_id"], current_user)
    return video if video.blank?
    add_message = video.add_user.name + "さんが「" + video.title + "」を追加しました。"
    Chat.create! room: video.room,
                 chat_type: "add_video",
                 message: add_message
    start_message = "「" + video.title + "」の再生を開始しました。"
    MessageReservationJob.set(wait_until: video.video_start_time).perform_later("start_video", start_message, video.room)
  end

  def message(data)
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
end
