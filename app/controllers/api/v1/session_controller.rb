class Api::V1::SessionController < ApplicationController
  include ApiCommon
  skip_before_action :authenticate_user_from_token!

  # POST /v1/login
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_email unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user
    else
      invalid_password
    end
  end

  private

    def invalid_email
      warden.custom_failure!
      # TODO: locale見当たらない
      render json: { error: t("invalid_email") }, status: 400
    end

    def invalid_password
      warden.custom_failure!
      # TODO: locale見当たらない
      render json: { error: t("invalid_password") }, status: 400
    end
end
