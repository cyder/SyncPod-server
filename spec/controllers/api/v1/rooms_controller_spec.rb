require "rails_helper"

describe Api::V1::RoomsController do
  let(:user) { create(:user) }

  describe "POST #create" do
    subject { post :create, params: params, format: :json }

    context "with correct params" do
      let(:params) { { room: { name: "test", description: "test" } } }
      before { request.headers["Authorization"] = user.access_token }
      it { expect { subject }.to change(Room, :count).by(1) }
    end

    context "without access token" do
      let(:params) { { room: { name: "test", description: "test" } } }
      it { expect { subject }.to change(Room, :count).by(0) }
    end
  end
end
