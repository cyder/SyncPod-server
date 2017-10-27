require "rails_helper"

describe Chat do
  it "is valid with correct param" do
    chat = build(:user_chat)
    expect(chat).to be_valid
  end

  describe "after_create_commit" do
    let(:chat) { build(:user_chat) }

    it "is sends add_message_broadcast_job" do
      assert_enqueued_with(job: AddMessageBroadcastJob) { chat.save }
    end
  end
end
