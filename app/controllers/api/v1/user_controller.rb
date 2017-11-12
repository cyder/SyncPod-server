class Api::V1::UserController < ApplicationController
  include ApiCommon

  DEFAULT_NUM = 10

  def joined_room
    num = params[:num] || DEFAULT_NUM
    @rooms = current_user.joined_room.limit(num)
  end
end
