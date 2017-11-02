require "rails_helper"

describe Room do
  let(:margin) { 10 }
  let(:room) { build(:room) }

  it "is valid with correct param" do
    room = build(:room)
    expect(room).to be_valid
  end

  describe "#add_video" do
    subject { room.add_video youtube_video_id, user }

    let(:user) { build(:user) }
    let(:youtube_video_id) { "XVId6EOnKq4" }
    it "create video" do
      expect { subject }.to change { Video.count }.by(1)
    end
    it { expect(subject.youtube_video_id).to eq youtube_video_id }
  end

  describe "#calc_video_start_time" do
    subject { room.calc_video_start_time.to_s }

    let(:video) { build(:video, room: room, video_start_time: last_video_start_time, video_end_time: last_video_end_time) }
    let(:expectation) { (start_time + Settings.movie.interval).to_s }

    context "when room have not videos" do
      let(:start_time) { Time.now.utc }
      it { is_expected.to eq expectation }
    end

    context "when room have a playing video" do
      let(:last_video_start_time) { Time.now.utc - margin }
      let(:last_video_end_time) { Time.now.utc + margin }
      let(:start_time) { video.video_end_time }
      before { video.save! }
      it { is_expected.to eq expectation }
    end

    context "when room do not have a playing video" do
      let(:last_video_start_time) { Time.now.utc - margin }
      let(:last_video_end_time) { Time.now.utc - margin }
      let(:start_time) { Time.now.utc }
      before { video.save! }
      it { is_expected.to eq expectation }
    end
  end

  describe "#now_playing_video" do
    subject { room.now_playing_video }

    let(:video) { build(:video, room: room, video_start_time: last_video_start_time, video_end_time: last_video_end_time) }

    context "when room have a playing video" do
      let(:last_video_start_time) { Time.now.utc - margin }
      let(:last_video_end_time) { Time.now.utc + margin }
      before { video.save! }
      it { is_expected.to eq video }
    end

    context "when room have not a playing video" do
      let(:last_video_start_time) { Time.now.utc - margin }
      let(:last_video_end_time) { Time.now.utc - margin }
      before { video.save! }
      it { is_expected.to eq nil }
    end
  end

  describe "#last_played_video" do
    subject { room.last_played_video }

    let(:video) { build(:video, room: room, video_start_time: last_video_start_time, video_end_time: last_video_end_time) }

    context "when room have not played videos" do
      let(:last_video_start_time) { Time.now.utc - margin }
      let(:last_video_end_time) { Time.now.utc + margin }
      before { video.save! }
      it { is_expected.to eq nil }
    end

    context "when room have a played video" do
      let(:last_video_start_time) { Time.now.utc - margin }
      let(:last_video_end_time) { Time.now.utc - margin }
      before { video.save! }
      it { is_expected.to eq video }
    end
  end

  describe "#play_list" do
    subject { room.play_list }

    let(:video1) { build(:video, room: room, video_start_time: last_video_start_time1) }
    let(:video2) { build(:video, room: room, video_start_time: last_video_start_time2) }
    let(:room) { build(:room) }

    context "when room do not have a video" do
      it { is_expected.to eq [] }
    end

    context "when room have some videos" do
      let(:last_video_start_time1) { Time.now.utc + margin }
      let(:last_video_start_time2) { Time.now.utc + margin * 2 }
      before {
        video1.save!
        video2.save!
      }
      it { is_expected.to eq [video1, video2] }
    end
  end

  describe "#past_chats" do
    subject { room.past_chats 2 }

    let(:chat1) { build(:user_chat, room: room, created_at: Time.now.utc - margin * 2) }
    let(:chat2) { build(:user_chat, room: room, created_at: Time.now.utc - margin) }
    let(:chat3) { build(:user_chat, room: room, created_at: Time.now.utc) }
    let(:room) { build(:room) }

    context "when room do not have a chat" do
      it { is_expected.to eq [] }
    end

    context "when room have some chats" do
      before {
        chat1.save!
        chat2.save!
        chat3.save!
      }
      it { is_expected.to eq [chat2, chat3] }
    end
  end
end
