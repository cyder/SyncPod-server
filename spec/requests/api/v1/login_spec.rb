require "rails_helper"

describe "POST /api/v1/login" do
  let(:user) { create(:user) }

  context "with valid params" do
    let(:params) { { email: user.email, password: user.password } }
    it "returns a user", :autodoc do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("user")
      expect(body).to be_json_eql(user.id).at_path("user/id")
    end

    it "returns a user's access token" do
      is_expected.to eq 200
      body = response.body
      expect(body).to be_json_eql(%("#{user.access_token}")).at_path("user/access_token")
    end
  end

  context "with invalid password" do
    let(:params) { { email: user.email, password: "invalid_password" } }
    it "returns a error message" do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("error")
    end
  end

  context "with invalid email" do
    let(:params) { { email: "invalid@example.com", password: user.password } }
    it "returns a error message" do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("error")
    end
  end
end
