require "rails_helper"

describe "user_report" do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => user.access_token } }

  describe "POST /api/v1/user_report" do
    let(:message) { "message" }
    let(:params) { { message: message } }

    context "with invalid params" do
      let(:message) { nil }
      it "returns a error" do
        is_expected.to eq 400
        body = response.body
        expect(body).to have_json_path("error")
      end
      it { expect { subject }.to change { UserReport.count }.by(0) }
    end

    context "with valid params" do
      it "returns a success message", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to be_json_eql(%("success")).at_path("result")
        expect(body).to be_json_eql(%("#{message}")).at_path("user_report/message")
      end
      it { expect { subject }.to change { UserReport.count }.by(1) }
    end

    context "without sign in" do
      let(:headers) { { "Authorization" => nil } }
      it "returns a error message" do
        is_expected.to eq 401
        expect(body).to have_json_path("error")
      end
      it { expect { subject }.to change { UserReport.count }.by(0) }
    end
  end
end
