class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_for current_user
    now_playing_video = Room.find(1).now_playing_video
    if now_playing_video.present?
      RoomChannel.broadcast_to current_user,
                               render_now_playing_video_json(now_playing_video)
    end
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
end
