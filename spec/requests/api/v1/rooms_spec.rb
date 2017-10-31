require "rails_helper"

describe "POST /api/v1/rooms" do
  let(:room) { build(:room) }
  let(:user) { create(:user) }

  context "with valid params" do
    let(:params) { { room: attributes_for(:room) } }
    let(:headers) { { "Authorization" => user.access_token } }
    it "returns a room", :autodoc do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("room")
      expect(body).to be_json_eql(%("#{room.name}")).at_path("room/name")
    end

    it "returns a room key" do
      is_expected.to eq 200
      body = response.body
      expect(body).to have_json_path("room/key")
    end
  end

  context "without sign in" do
    let(:params) { { room: attributes_for(:room) } }
    it "returns a error message" do
      is_expected.to eq 401
      expect(body).to have_json_path("error")
    end
  end
end
