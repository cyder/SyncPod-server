class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_for current_user
    room = Room.find(1)
    now_playing_video = Room.find(1).now_playing_video
    if now_playing_video.present?
      RoomChannel.broadcast_to current_user,
                               render_now_playing_video_json(now_playing_video)
    end
    RoomChannel.broadcast_to current_user,
                             render_play_list_json(room)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add_video(data)
    Video.add(1, data["youtube_video_id"])
  end

  private

    def render_now_playing_video_json(video)
      Jbuilder.encode do |json|
        json.data_type "now_playing_video"
        json.data do
          json.video video,
                     :id,
                     :youtube_video_id,
                     :title,
                     :current_time
        end
      end
    end

    def render_play_list_json(room)
      Jbuilder.encode do |json|
        json.data_type "play_list"
        json.data do
          json.play_list room.play_list
        end
      end
    end
end
