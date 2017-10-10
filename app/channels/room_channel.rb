class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_for current_user
    @room = Room.find(1)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def now_playing_video
    RoomChannel.broadcast_to current_user,
                             render_now_playing_video_json(@room)
  end

  def play_list
    RoomChannel.broadcast_to current_user,
                             render_play_list_json(@room)
  end

  def add_video(data)
    Video.add(1, data["youtube_video_id"])
  end

  private

    def render_now_playing_video_json(room)
      video = room.now_playing_video
      Jbuilder.encode do |json|
        json.data_type "now_playing_video"
        json.data do
          if video.present?
            json.video video,
                       :id,
                       :youtube_video_id,
                       :title,
                       :current_time
          else
            nil
          end
        end
      end
    end

    def render_play_list_json(room)
      Jbuilder.encode do |json|
        json.data_type "play_list"
        json.data do
          json.play_list room.play_list,
                         :id,
                         :youtube_video_id,
                         :title,
                         :video_start_time
        end
      end
    end
end
