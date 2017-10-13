class AddMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast "room_channel", render_json(chat)
  end

  private

    def render_json(chat)
      ApplicationController.renderer.render("jbuilder/add_chat",
                                             formats: "json",
                                             handlers: "jbuilder",
                                             locals: { chat: chat })
    end

end
