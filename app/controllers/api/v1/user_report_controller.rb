class Api::V1::UserReportController < ApplicationController
  include ApiCommon

  def create
    @user_report = UserReport.new(user: current_user, message: params[:message])
    unless @user_report.save
      # TODO: localeファイルに書いておくやつな気がする
      render json: { error: t("user_report_create_error") }, status: 400
      return
    end
    send_slack_message @user_report if Rails.env.production?
  end

  private

    def send_slack_message(user_report)
      slack_message = "*from: #{user_report.user.name} <<mailto:#{user_report.user.email}|#{user_report.user.email}>>*\n#{user_report.message}"
      notifier = Slack::Notifier.new ENV["USER_REPORT_SLACK_WEBHOOK_URL"]
      notifier.ping(Slack::Notifier::Util::LinkFormatter.format(slack_message))
    end
end
