require "rails_helper"

describe Api::V1::RoomsController do
  let(:user) { create(:user) }
  let(:room) { build(:room) }
  let(:params) { { room: { name: name, description: description } } }
  let(:name) { room.name }
  let(:description) { room.description }

  describe "POST #create" do
    subject { post :create, params: params, format: :json }

    context "with valid params" do
      before { request.headers["Authorization"] = user.access_token }
      it { expect { subject }.to change(Room, :count).by(1) }
    end

    context "with invalid name" do
      let(:name) { nil }
      before { request.headers["Authorization"] = user.access_token }
      it { expect { subject }.to change(Room, :count).by(0) }
    end

    context "with invalid description" do
      let(:description) { nil }
      before { request.headers["Authorization"] = user.access_token }
      it { expect { subject }.to change(Room, :count).by(0) }
    end

    context "without access token" do
      let(:params) { { room: { name: "test", description: "test" } } }
      it { expect { subject }.to change(Room, :count).by(0) }
    end
  end
end
