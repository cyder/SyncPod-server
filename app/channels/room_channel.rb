class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_for current_user
    RoomChannel.broadcast_to current_user, render_first_json(1)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add_video(data)
    Video.add(1, data["youtube_video_id"])
  end

  private

    def render_first_json(room_id)
      now_playing_video = Room.find(room_id).now_playing_video
      Jbuilder.encode do |json|
        if now_playing_video.present?
          json.now_playing_video now_playing_video
          json.current_time now_playing_video.current_time
        end
      end
    end
end
