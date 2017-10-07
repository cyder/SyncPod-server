class AddVideoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(video)
    ActionCable.server.broadcast "room_channel", render_json(video)
  end

  private

    def render_json(video)
      Jbuilder.encode do |json|
        json.data_type "add_video"
        json.data do
          json.video video,
                     :id,
                     :youtube_video_id,
                     :title,
                     :video_start_time
        end
      end
    end
end
