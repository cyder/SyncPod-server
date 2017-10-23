class Api::V1::SessionController < ApplicationController
  include ApiCommon
  skip_before_action :authenticate_user_from_token!

  # POST /v1/login
  def create
    @user = User.find_for_database_authentication(id: params[:user_id])
    return invalid_user_id unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user
    else
      invalid_password
    end
  end

  private

    def invalid_user_id
      warden.custom_failure!
      render json: { error: t('invalid_user_id') }
    end

    def invalid_password
      warden.custom_failure!
      render json: { error: t('invalid_password') }
    end
end
