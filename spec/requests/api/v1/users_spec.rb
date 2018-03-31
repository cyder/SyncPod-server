require "rails_helper"

describe "POST /api/v1/users" do
  let(:user) { build(:user) }
  let(:params) { { user: { email: email, password: password } } }
  let(:email) { user.email }
  let(:password) { user.password }

  context "with invalid email" do
    let(:email) { nil }
    it "returns a error" do
      is_expected.to eq 400
      body = response.body
      expect(body).to have_json_path("error")
    end
    it { expect { subject }.to change(User, :count).by(0) }
  end

  context "with existed email" do
    before { user.save! }
    it "returns a error" do
      is_expected.to eq 400
      body = response.body
      expect(body).to have_json_path("error")
    end
    it { expect { subject }.to change(User, :count).by(0) }
  end

  context "with invalid password" do
    let(:password) { nil }
    it "returns a error" do
      is_expected.to eq 400
      body = response.body
      expect(body).to have_json_path("error")
    end
    it { expect { subject }.to change(User, :count).by(0) }
  end

  context "with valid params" do
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

    it { expect { subject }.to change(User, :count).by(1) }
  end
end
