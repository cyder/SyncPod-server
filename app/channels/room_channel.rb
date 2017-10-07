class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_for current_user
    RoomChannel.broadcast_to current_user, render_now_playing_video_json(1)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add_video(data)
    Video.add(1, data["youtube_video_id"])
  end

  private

    def render_now_playing_video_json(room_id)
      now_playing_video = Room.find(room_id).now_playing_video
      Jbuilder.encode do |json|
        json.data_type "now_playing_video"
        json.data do
          if now_playing_video.present?
            json.video now_playing_video,
                       :id,
                       :youtube_video_id,
                       :title,
                       :current_time
          end
        end
      end
    end
end
