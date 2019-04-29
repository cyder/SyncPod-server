class Api::V1::ChatsController < ApplicationController
  def index
    room = Room.find_by(key: params[:room_key])
    if room.blank?
      render json: { error: t("404 error") }, status: 404
      return
    end

    if params[:cursor].present?
      cursor = Chat.find_by(id: params[:cursor])
      if cursor.blank?
        render json: { error: t("404 error") }, status: 404
        return
      end
      @chats = room.past_chats(10, cursor)
    else
      @chats = room.past_chats(10)
    end
  end
end
