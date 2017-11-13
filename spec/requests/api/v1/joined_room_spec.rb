require "rails_helper"

describe "joined_room" do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => user.access_token } }
  let(:room) { create(:room) }
  let(:margin) { 10 }
  let(:entry_at) { Time.now.utc - margin }
  let(:user_room_log) { build(:user_room_log, user: user, room: room, entry_at: entry_at) }

  describe "GET /api/v1/joined_room" do
    before { user_room_log.save }
    context "with valid params" do
      it "returns a room", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to be_json_eql(room.id).at_path("0/id")
      end
    end

    context "without sign in" do
      let(:headers) { { "Authorization" => nil } }
      it "returns a error message" do
        is_expected.to eq 401
        expect(body).to have_json_path("error")
      end
    end
  end
end
