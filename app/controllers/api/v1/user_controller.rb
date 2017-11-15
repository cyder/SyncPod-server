class Api::V1::UserController < ApplicationController
  include ApiCommon

  DEFAULT_NUM = 10

  def joined_rooms
    num = params[:num] || DEFAULT_NUM
    @rooms = current_user.joined_rooms.limit(num)
  end
end
