class Api::V1::RoomsController < ApplicationController
  include ApiCommon

  def create
    @room = Room.new room_params

    unless @room.save!
      render json: { error: t("room_create_error") }, status: :unprocessable_entity
    end
  end

  private

    def room_params
      params.require(:room).permit(:name, :description)
    end
end
