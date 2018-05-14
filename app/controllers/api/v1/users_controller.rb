class Api::V1::UsersController < ApplicationController
  include ApiCommon
  skip_before_action :authenticate_user_from_token!, only: [:create]

  # POST
  # Create an user
  def create
    # TODO: かっこをつけたい
    @user = User.new user_params

    # TODO: !をつけたらraiseでこけるのでは
    unless @user.save
      # TODO: locale見当たらない
      render json: { error: t("user_create_error") }, status: 400
    end
  end

  def update
    @user = current_user
    unless @user.update(user_params)
      render json: { error: t("user_create_error") }, status: 400
    end
  end

  def upload_icon
    @user = current_user
    unless @user.update(icon: params[:icon])
      render json: { error: t("user_icon_upload_error") }, status: 400
    end
  end

  # 最近参加したルームを返す
  def joined_rooms
    default_num = 10

    num = params[:num] || default_num
    @rooms = current_user.joined_rooms.limit(num)
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
end
