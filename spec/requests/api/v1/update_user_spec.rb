require "rails_helper"

describe "PUT /api/v1/users" do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => user.access_token } }
  let(:params) { { user: user_params } }

  describe "change name" do
    context "with valid name" do
      let(:user_params) { { name: name } }
      let(:name) { "name" }

      it "returns a user", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("user")
        expect(body).to be_json_eql(%("#{name}")).at_path("user/name")
      end
    end
  end

  describe "change email" do
    context "with valid name" do
      let(:user_params) { { email: email } }
      let(:email) { "test@test.com" }

      it "returns a user", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("user")
        expect(body).to be_json_eql(%("#{email}")).at_path("user/email")
      end
    end
  end

  describe "change password" do
    context "with valid name" do
      let(:user_params) { { password: password } }
      let(:password) { "password" }

      it "returns a user", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("user")
      end
    end
  end
end
