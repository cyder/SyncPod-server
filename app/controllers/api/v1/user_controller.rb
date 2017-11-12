class Api::V1::UserController < ApplicationController
  include ApiCommon

  def joined_room
    @rooms = current_user.joined_room
  end
end
