class Api::V1::RoomsController < ApplicationController
  include ApiCommon
  skip_before_action :authenticate_user_from_token!, only: [:index, :show, :popular, :recommend]

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
    @room.create_user = current_user
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
    max_num = 10

    @rooms = Room.published.
               order_by_online_user.
               limit(max_num)
  end

  def recommend
    max_num = 10

    ids = RecommendRoom.pluck(:room_id).sample(max_num)
    @rooms = Room.
               where(id: ids).
               order(["field(id, ?)", ids])
  end

  private

    def room_params
      params.require(:room).permit(:name, :description, :public)
    end
end
