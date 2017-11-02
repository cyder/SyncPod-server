require "rails_helper"

describe "room" do
  let(:user) { create(:user) }
  let(:headers) { { "Authorization" => user.access_token } }

  describe "POST /api/v1/rooms" do
    let(:room) { build(:room) }

    context "with valid params" do
      let(:params) { { room: attributes_for(:room) } }
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
      let(:headers) { { "Authorization" => nil } }
      let(:params) { { room: attributes_for(:room) } }
      it "returns a error message" do
        is_expected.to eq 401
        expect(body).to have_json_path("error")
      end
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
  end
end
