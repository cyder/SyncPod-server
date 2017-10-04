class AddVideoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(video)
    ActionCable.server.broadcast "room_channel", render_json(video)
  end

  private

    def render_json(video)
      Jbuilder.encode do |json|
        json.added_video video
      end
    end
end
