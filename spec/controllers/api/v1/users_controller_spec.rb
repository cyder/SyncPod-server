require "rails_helper"

describe Api::V1::UsersController do
  let(:user) { build(:user) }
  let(:params) { { user: { email: email, password: password } } }
  let(:email) { user.email }
  let(:password) { user.password }

  describe "POST #create" do
    subject { post :create, params: params, format: :json }

    context "with invalid email" do
      let(:email) { nil }
      it { expect { subject }.to change(User, :count).by(0) }
    end

    context "with existed email" do
      before { user.save! }
      it { expect { subject }.to change(User, :count).by(0) }
    end

    context "with invalid password" do
      let(:password) { nil }
      it { expect { subject }.to change(User, :count).by(0) }
    end

    context "with valid params" do
      it { expect { subject }.to change(User, :count).by(1) }
    end
  end
end
