class Api::V1::ChatsController < ApplicationController
  def index
    room = Room.find_by(key: params[:room_key])
    if room.blank?
      render json: { error: t("404 error") }, status: 404
      return
    end
    cursor = Chat.find_by(id: params[:cursor])
    @chats = room.past_chats(10, cursor)
  end
end
