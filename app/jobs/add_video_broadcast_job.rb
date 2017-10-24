class AddVideoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(video)
    ActionCable.server.broadcast "room_channel", render_json(video)
    message = video.add_user.name + "さんが「" + video.title + "」を追加しました。"
    Chat.create! room: video.room,
                 chat_type: "add_video",
                 message: message
  end

  private

    def render_json(video)
      ApplicationController.renderer.render("jbuilder/add_video",
                                            formats: "json",
                                            handlers: "jbuilder",
                                            locals: { video: video })
    end
end
