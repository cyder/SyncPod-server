require "rails_helper"

describe Api::V1::UsersController do
  describe "POST #create" do
    subject { post :create, params: params, format: :json }

    context "with correct params" do
      let(:params) { { user: { email: "test@example.com", password: "password", name: "name" } } }
      it { expect { subject }.to change(User, :count).by(1) }
    end
  end
end
