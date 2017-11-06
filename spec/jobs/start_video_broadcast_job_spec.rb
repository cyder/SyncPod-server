require "rails_helper"

describe StartVideoBroadcastJob, type: :job do
  let(:video) { create(:video) }
  let(:user) { create(:user) }
  let(:target) { "room_#{video.room.id}" }

  describe "#perform_later" do
    subject { StartVideoBroadcastJob.perform_later(video) }

    it { expect { subject }.to have_enqueued_job(StartVideoBroadcastJob).with(video) }
  end

  describe "perform_enqueued_jobs" do
    subject { perform_enqueued_jobs { StartVideoBroadcastJob.perform_later(video) } }

    it "expect to have broadcast" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("start_video")).at_path("data_type")
                            }
    end

    it "expect to have broadcast with video" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(video.id).at_path("data/video/id")
                            }
    end
  end
end
