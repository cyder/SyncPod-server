require "rails_helper"

describe Chat do
  context "with correct param" do
    it "is valid" do
      chat = create(:user_chat)
      expect(chat).to be_valid
    end
  end

  context "with emoji" do
    it "is valid" do
      chat = create(:user_chat_with_emoji)
      expect(chat).to be_valid
    end
  end

  describe "after_create_commit" do
    let(:chat) { build(:user_chat) }

    it "is sends add_message_broadcast_job" do
      assert_enqueued_with(job: AddMessageBroadcastJob) { chat.save }
    end
  end
end
