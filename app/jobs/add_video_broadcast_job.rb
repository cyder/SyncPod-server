class AddVideoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(video)
    ActionCable.server.broadcast "room_channel", render_json(video)
  end

  private

    def render_json(video)
      ApplicationController.renderer.render('jbuilder/add_video',
                                             formats: 'json',
                                             handlers: 'jbuilder',
                                             locals: { video: video })
    end
end
