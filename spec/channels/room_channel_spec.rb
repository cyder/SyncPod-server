require "rails_helper"

describe RoomChannel, type: :channel do
  let(:room) { create(:room) }
  let(:user) { create(:user) }
  let(:target) { RoomChannel.broadcasting_for([RoomChannel.channel_name, user]) }
  let(:stream_from) { "room_" + room.id.to_s }
  before { stub_connection current_user: user }

  describe "subscribes to a stream" do
    context "with correct params" do
      subject { subscribe room_key: room.key }

      it "subscribes to a stream" do
        subject
        expect(subscription).to be_confirmed
      end
      it "includes room id" do
        subject
        expect(streams).to include(stream_from)
      end
      it { expect { subject }.to change(Chat, :count).by(1) }
      it { expect { subject }.to change(UserRoomLog, :count).by(1) }
      it { expect { subject }.to change { room.online_users.count }.by(1) }
    end

    context "with invalid params" do
      subject { subscribe room_key: "invalid_key" }

      it "not subscribes to a stream" do
        subject
        expect(subscription).to be_rejected
      end
    end
  end

  describe "perform :unsubscribed" do
    subject { perform :unsubscribed }

    before { subscribe room_key: room.key }
    it { expect { subject }.to change(Chat, :count).by(1) }
    it { expect { subject }.to change { room.online_users.count }.by(-1) }
  end

  describe "perform :now_playint_video" do
    subject { perform :now_playing_video }

    before { subscribe room_key: room.key }
    it "expect to have broadcast" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("now_playing_video")).at_path("data_type")
                            }
    end
  end

  describe "perform :play_list" do
    subject { perform :play_list }

    before { subscribe room_key: room.key }
    it "expect to have broadcast" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("play_list")).at_path("data_type")
                            }
    end
  end

  describe "perform :past_chats" do
    subject { perform :past_chats }

    before { subscribe room_key: room.key }
    it "expect to have broadcast" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("past_chats")).at_path("data_type")
                            }
    end

    context "when room have a chat" do
      let(:chat) { build(:user_chat, room: room, user: user) }
      before { chat.save! }
      it "expect to have broadcast with chat" do
        expect { subject }.to have_broadcasted_to(target).with { |data|
                                expect(data).to be_json_eql(%("#{chat.message}")).at_path("data/past_chats/0/message")
                                expect(data).to be_json_eql(user.id).at_path("data/past_chats/0/user/id")
                              }
      end
    end
  end

  describe "perform :add_video" do
    subject { perform :add_video, youtube_video_id: "AS4q9yaWJkI" }

    before { subscribe room_key: room.key }
    it { expect { subject }.to change(Video, :count).by(1) }
    it { expect { subject }.to change(Chat, :count).by(1) }
    it "is sends add_message_broadcast_job" do
      assert_enqueued_with(job: MessageReservationJob) { subject }
    end
  end

  describe "perform :message" do
    subject { perform :message, message: message }

    let(:message) { "message" }
    before { subscribe room_key: room.key }
    it { expect { subject }.to change(Chat, :count).by(1) }
  end

  describe "perform :force_exit" do
    subject { perform :force_exit, user_id: another_user.id }

    let(:another_user) { create(:user1) }
    let(:another_target) { RoomChannel.broadcasting_for([RoomChannel.channel_name, another_user]) }

    before { subscribe room_key: room.key }

    it "expect to have broadcast with error" do
      expect { subject }.to have_broadcasted_to(another_target).with { |data|
                              expect(data).to be_json_eql(%("error")).at_path("data_type")
                              expect(data).to be_json_eql(%("force exit")).at_path("data/message")
                            }
    end
  end
end
