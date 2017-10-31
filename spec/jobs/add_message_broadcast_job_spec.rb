require "rails_helper"

describe AddMessageBroadcastJob, type: :job do
  let(:chat) { create(:user_chat) }
  let(:user) { create(:user) }
  let(:target) { "room_#{chat.room.id}" }

  describe "#perform_later" do
    subject { AddMessageBroadcastJob.perform_later(chat) }

    it { expect { subject }.to have_enqueued_job(AddMessageBroadcastJob).with(chat) }
  end

  describe "perform_enqueued_jobs" do
    subject { perform_enqueued_jobs { AddMessageBroadcastJob.perform_later(chat) } }

    it "expect to have broadcast" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("add_chat")).at_path("data_type")
                            }
    end

    it "expect to have broadcast with chat" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("#{chat.message}")).at_path("data/chat/message")
                              expect(data).to be_json_eql(user.id).at_path("data/chat/user/id")
                            }
    end
  end
end
