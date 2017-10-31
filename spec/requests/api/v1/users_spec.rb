require "rails_helper"

describe "POST /api/v1/users" do
  let(:user) { build(:user) }

  context "with valid params" do
    let(:params) { { user: attributes_for(:user) } }
    it "returns a user", :autodoc do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("user")
      expect(body).to be_json_eql(%("#{user.email}")).at_path("user/email")
    end

    it "returns a user's access token" do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("user/access_token")
    end
  end
end
