class Api::V1::RoomsController < ApplicationController
  include ApiCommon

  MAX = 10

  def index
    @room = Room.find_by(key: params[:room_key])
    if @room.blank?
      render json: { error: t("404 error") }, status: 404
      return
    end
    render :show
  end

  def create
    @room = Room.new room_params
    unless @room.save
      # TODO: localeファイルに書いておくやつな気がする
      render json: { error: t("room_create_error") }, status: 400
    end
  end

  def show
    @room = Room.find_by(id: params[:id])
    if @room.blank?
      render json: { error: t("404 error") }, status: 404
    end
  end

  def popular
    @rooms = Room.where(public: true).
               sort_by { |room| room.online_users.size }.
               select { |room| room.online_users.present? }.
               reverse.
               take(MAX)
  end

  private

    def room_params
      params.require(:room).permit(:name, :description, :public)
    end
end
