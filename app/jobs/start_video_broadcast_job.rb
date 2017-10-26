class StartVideoBroadcastJob < ApplicationJob
  queue_as :default

  def perform(video)
    ActionCable.server.broadcast "room_#{video.room.id}", render_json(video)
    Chat.create! room: video.room,
                 chat_type: "start_video",
                 message: "「" + video.title + "」の再生を開始しました。"
  end

  private

    def render_json(video)
      ApplicationController.renderer.render("jbuilder/start_video",
                                            formats: "json",
                                            handlers: "jbuilder",
                                            locals: { video: video })
    end
end
