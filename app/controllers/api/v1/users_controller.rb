class Api::V1::UsersController < ApplicationController
  include ApiCommon
  skip_before_action :authenticate_user_from_token!, only: [:create]

  # POST
  # Create an user
  def create
    @user = User.new user_params

    unless @user.save!
      render json: { error: t("user_create_error") }, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name)
    end
end
