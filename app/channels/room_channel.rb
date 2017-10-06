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
      now_playing_video = Video.get_now_playing_video room_id
      Jbuilder.encode do |json|
        if now_playing_video.present?
          json.now_playing_video now_playing_video
        end
      end
    end
end
