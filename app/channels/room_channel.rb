class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_for current_user
    @room = Room.find(1)
    message = current_user.name + "さんが入室しました。"
    Chat.create! room: @room, chat_type: "login", message: message
  end

  def unsubscribed
    message = current_user.name + "さんが退室しました。"
    Chat.create! room: @room, chat_type: "logout", message: message
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
    @room.add_video(data["youtube_video_id"])
  end

  def message(data)
    Chat.create! room: @room, chat_type: "user", message: data["message"]
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
