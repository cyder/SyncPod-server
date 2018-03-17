class Api::V1::UserReportController < ApplicationController
  include ApiCommon

  def create
    @user_report = UserReport.new(user: current_user, message: params[:message])
    unless @user_report.save
      # TODO: localeファイルに書いておくやつな気がする
      render json: { error: t("user_report_create_error") }, status: 400
    end
  end
end
