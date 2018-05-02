require "rails_helper"

describe "room" do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => user.access_token } }

  describe "POST /api/v1/rooms" do
    let(:room) { build(:room) }
    let(:params) { { room: { name: name, description: description } } }
    let(:name) { room.name }
    let(:description) { room.description }

    context "with invalid name" do
      let(:name) { nil }
      it "returns a error" do
        is_expected.to eq 400
        body = response.body
        expect(body).to have_json_path("error")
      end
      it { expect { subject }.to change(Room, :count).by(0) }
    end

    context "with invalid description" do
      let(:name) { nil }
      it "returns a error" do
        is_expected.to eq 400
        body = response.body
        expect(body).to have_json_path("error")
      end
      it { expect { subject }.to change(Room, :count).by(0) }
    end

    context "with valid params" do
      it "returns a room" do
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

      it { expect { subject }.to change(Room, :count).by(1) }
    end

    context "with valid params with public flag" do
      let(:public) { true }
      let(:params) { { room: { name: name, description: description, public: public } } }

      it "returns a room", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("room")
        expect(body).to be_json_eql(public).at_path("room/public")
      end
    end

    context "without sign in" do
      let(:headers) { { "Authorization" => nil } }
      it "returns a error message" do
        is_expected.to eq 401
        expect(body).to have_json_path("error")
      end
      it { expect { subject }.to change(Room, :count).by(0) }
    end
  end

  describe "GET /api/v1/rooms/:id" do
    let!(:room) { create(:room) }
    let(:id) { room.id }
    let(:video) { build(:video, room: room, video_start_time: start_time, video_end_time: end_time) }
    let(:margin) { 10 }

    context "with invalid id" do
      let(:id) { "invalid_id" }
      it { is_expected.to eq 404 }
    end

    context "with valid id" do
      it "returns a room", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("room")
        expect(body).to be_json_eql(id).at_path("room/id")
      end
    end

    context "when a now playing video exists" do
      let(:start_time) { Time.now.utc - margin }
      let(:end_time) { Time.now.utc + margin }
      before { video.save! }
      it "returns a now playing video" do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("room/now_playing_video")
        expect(body).to be_json_eql(video.id).at_path("room/now_playing_video/id")
      end
    end

    context "when a played video exists" do
      let(:start_time) { Time.now.utc - margin }
      let(:end_time) { Time.now.utc }
      before { video.save! }
      it "returns a last played video" do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("room/last_played_video")
        expect(body).to be_json_eql(video.id).at_path("room/last_played_video/id")
      end
    end

    context "when room has a online user" do
      let(:log) { build(:user_room_log, user: user, room: room, exit_at: nil) }
      before { log.save! }
      it "returns a online user" do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("room/online_users/0")
        expect(body).to be_json_eql(user.id).at_path("room/online_users/0/id")
      end
    end
  end

  describe "GET /api/v1/rooms" do
    let!(:room) { create(:room) }
    let(:params) { { room_key: room.key } }

    context "with invalid room key" do
      let(:params) { { room_key: "invalid_id" } }
      it { is_expected.to eq 404 }
    end

    context "with valid room key" do
      it "returns a room", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to have_json_path("room")
        expect(body).to be_json_eql(%("#{room.key}")).at_path("room/key")
      end
    end
  end

  describe "GET /api/v1/rooms/popular" do
    let(:margin) { 10 }
    let(:entry_at) { Time.now.utc - margin }
    let!(:room) { create(:public_room) }
    let!(:user_room_log) { create(:user_room_log, room: room, exit_at: false) }

    context "with valid params" do
      it "returns a rooms", :autodoc do
        is_expected.to eq 200
        body = response.body
        expect(body).to be_json_eql(room.id).at_path("rooms/0/id")
      end
    end
  end
end
