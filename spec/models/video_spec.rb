require "rails_helper"

describe Video do
  it "is valid with correct param" do
    video = build(:video)
    expect(video).to be_valid
  end

  describe "#current_time" do
    subject { video.current_time }

    let(:video) { build(:video, video_start_time: start_time, video_end_time: end_time) }
    let(:margin) { 10 }

    context "now > video_end_time" do
      let(:start_time) { Time.now.utc - margin }
      let(:end_time) { Time.now.utc - margin }
      it { is_expected.to eq nil }
    end

    context "now < video_start_time" do
      let(:start_time) { Time.now.utc + margin }
      let(:end_time) { Time.now.utc + margin }
      it { is_expected.to eq 0 }
    end

    context "video_start_time < now < now_video_end_time" do
      let(:start_time) { Time.now.utc - margin }
      let(:end_time) { Time.now.utc + margin }
      it { is_expected.to eq margin }
    end
  end

  describe "after_create_commit" do
    let(:video) { build(:video) }

    it "is sends add_video_broadcast_job" do
      assert_enqueued_with(job: AddVideoBroadcastJob) { video.save }
    end

    it "is sends start_video_broadcast_job" do
      assert_enqueued_with(job: StartVideoBroadcastJob, at: video.video_start_time) { video.save }
    end
  end
end
