require "rails_helper"

describe "POST /api/v1/users/upload_icon" do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => user.access_token } }
  let(:params) { { icon: fixture_file_upload("/images/user_icon.jpg", "image/jpeg") } }

  context "with valid params" do
    it "returns a user", :autodoc do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("user")
    end
  end

  context "without sign in" do
    let(:headers) { { "Authorization" => nil } }
    it "returns a error message" do
      is_expected.to eq 401
      body = response.body
      expect(body).to have_json_path("error")
    end
  end
end
