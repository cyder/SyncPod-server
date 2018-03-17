require "rails_helper"

describe Api::V1::UserReportController do
  let(:user) { create(:user) }
  let(:params) { { message: message } }
  let(:message) { "message" }

  describe "POST #create" do
    subject { post :create, params: params, format: :json }

    context "with valid params" do
      before { request.headers["Authorization"] = user.access_token }
      it { expect { subject }.to change { UserReport.count }.by(1) }
    end

    context "with invalid message" do
      let(:message) { nil }
      before { request.headers["Authorization"] = user.access_token }
      it { expect { subject }.to change { UserReport.count }.by(0) }
    end

    context "without access token" do
      let(:params) { { room: { name: "test", description: "test" } } }
      it { expect { subject }.to change { UserReport.count }.by(0) }
    end
  end
end
