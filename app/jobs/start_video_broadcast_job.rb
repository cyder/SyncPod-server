class StartVideoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(video)
    ActionCable.server.broadcast "room_channel", render_json(video)
  end

  private

    def render_json(video)
      Jbuilder.encode do |json|
        json.start_video video
      end
    end
end
