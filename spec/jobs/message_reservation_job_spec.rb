require "rails_helper"

describe MessageReservationJob, type: :job do
  let(:room) { create(:room) }
  let(:target) { "room_#{room.id}" }
  let(:type) { "start_video" }
  let(:message) { "message" }

  describe "#perform_later" do
    subject { MessageReservationJob.perform_later(type, message, room) }

    it { expect { subject }.to have_enqueued_job(MessageReservationJob).with(type, message, room) }
  end

  describe "perform_enqueued_jobs" do
    subject { perform_enqueued_jobs { MessageReservationJob.perform_later(type, message, room) } }

    it { expect { subject }.to change(Chat, :count).by(1) }

    it "expect to have broadcast" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("add_chat")).at_path("data_type")
                            }
    end

    it "expect to have broadcast with chat" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("#{type}")).at_path("data/chat/chat_type")
                              expect(data).to be_json_eql(%("#{message}")).at_path("data/chat/message")
                            }
    end
  end
end
