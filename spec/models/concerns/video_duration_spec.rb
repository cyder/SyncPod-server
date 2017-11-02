require "rails_helper"

describe VideoDuration do
  let(:duration) { VideoDuration.new(arg) }
  let(:expectation) { (Time.now.utc + arg_second).to_s }

  describe "#video_end_time" do
    subject { (duration.video_end_time Time.now.utc).to_s }

    context "when duration = 0:00:05" do
      let(:arg) { "PT5S" }
      let(:arg_second) { 5 }
      it { is_expected.to eq expectation }
    end

    context "when duration = 0:05:00" do
      let(:arg) { "PT5M0S" }
      let(:arg_second) { 5 * 60 }
      it { is_expected.to eq expectation }
    end

    context "when duration = 5:00:00" do
      let(:arg) { "PT5H0M0S" }
      let(:arg_second) { 5 * 60 * 60 }
      it { is_expected.to eq expectation }
    end
  end

  describe "#video_end_time" do
    subject { duration.text }

    context "when duration = 0:00:05" do
      let(:arg) { "PT5S" }
      it { is_expected.to eq "0:05" }
    end

    context "when duration = 0:05:00" do
      let(:arg) { "PT5M0S" }
      it { is_expected.to eq "5:00" }
    end

    context "when duration = 5:00:00" do
      let(:arg) { "PT5H0M0S" }
      it { is_expected.to eq "5:00:00" }
    end
  end

  describe "#duration_to_array" do
    subject { duration.send(:duration_to_array, arg) }

    context "when duration = 0:00:05" do
      let(:arg) { "PT5S" }
      it { is_expected.to eq [0, 0, 5] }
    end

    context "when duration = 0:05:00" do
      let(:arg) { "PT5M0S" }
      it { is_expected.to eq [0, 5, 0] }
    end

    context "when duration = 5:00:00" do
      let(:arg) { "PT5H0M0S" }
      it { is_expected.to eq [5, 0, 0] }
    end
  end
end
