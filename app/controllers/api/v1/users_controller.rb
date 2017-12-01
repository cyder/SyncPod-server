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
    unless @user.update_attributes(user_params)
      render json: { error: t("user_create_error") }, status: 400
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
end
