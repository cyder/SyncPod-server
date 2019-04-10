require "rails_helper"

describe RoomChannel, type: :channel do
  let(:room) { create(:room) }
  let(:room_key) { room.key }
  let(:user) { create(:user) }
  let(:target) { RoomChannel.broadcasting_for([RoomChannel.channel_name, subscription.uuid]) }
  let(:stream_from) { "room_" + room.id.to_s }
  let(:current_user) { user }
  before { stub_connection current_user: current_user }

  describe "subscribes to a stream (subscription and streams)" do
    describe "when user is not banned" do
      before { subscribe room_key: room_key }

      context "with correct params" do
        it { expect(subscription).to be_confirmed }
        it { expect(streams).to include(stream_from) }
      end

      context "with invalid params" do
        let(:room_key) { "invalid_key" }

        it { expect(subscription).to be_rejected }
      end

      context "without login" do
        let(:current_user) { nil }
        it { expect(subscription).to be_confirmed }
        it { expect(streams).to include(stream_from) }
      end
    end

    describe "when user is banned" do
      before do
        create(:ban_report, target: user, room: room, expiration_at: expiration_at)
        subscribe room_key: room_key
      end

      context "before expiration date" do
        let(:expiration_at) { Time.now.utc + 60 * 60 * 24 }

        it { expect(subscription).to be_rejected }
      end

      context "after expiration date" do
        let(:expiration_at) { Time.now.utc - 60 * 60 * 24 }

        it { expect(subscription).to be_confirmed }
      end
    end
  end

  describe "subscribes to a stream (model)" do
    subject { subscribe room_key: room_key }

    context "with correct params" do
      it { expect { subject }.to change(Chat, :count).by(1) }
      it { expect { subject }.to change(UserRoomLog, :count).by(1) }
      it { expect { subject }.to change { room.online_users.count }.by(1) }
    end

    context "with invalid params" do
      let(:room_key) { "invalid_key" }

      it { expect { subject }.to change(Chat, :count).by(0) }
      it { expect { subject }.to change(UserRoomLog, :count).by(0) }
      it { expect { subject }.to change { room.online_users.count }.by(0) }
    end

    context "without login" do
      let(:current_user) { nil }

      it { expect { subject }.to change(Chat, :count).by(0) }
      it { expect { subject }.to change(UserRoomLog, :count).by(0) }
      it { expect { subject }.to change { room.online_users.count }.by(0) }
    end
  end

  describe "perform :unsubscribed" do
    subject { perform :unsubscribed }

    before { subscribe room_key: room.key }
    it { expect { subject }.to change(Chat, :count).by(1) }
    it { expect { subject }.to change { room.online_users.count }.by(-1) }

    context "without login" do
      let(:current_user) { nil }

      it { expect { subject }.to change(Chat, :count).by(0) }
      it { expect { subject }.to change { room.online_users.count }.by(0) }
    end
  end

  describe "perform :now_playint_video" do
    subject { perform :now_playing_video }

    before { subscribe room_key: room.key }
    it "expect to have broadcast" do
      expect { subject }.to have_broadcasted_to(target).with { |data|
                              expect(data).to be_json_eql(%("now_playing_video")).at_path("data_type")
                            }
    end

    context "without login" do
      let(:current_user) { nil }

      it "expect to have broadcast" do
        expect { subject }.to have_broadcasted_to(target).with { |data|
                                expect(data).to be_json_eql(%("now_playing_video")).at_path("data_type")
                              }
      end
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

    context "without login" do
      let(:current_user) { nil }

      it "expect to have broadcast" do
        expect { subject }.to have_broadcasted_to(target).with { |data|
                                expect(data).to be_json_eql(%("play_list")).at_path("data_type")
                              }
      end
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

    context "without login" do
      let(:current_user) { nil }

      it "expect to have broadcast" do
        expect { subject }.to have_broadcasted_to(target).with { |data|
                                expect(data).to be_json_eql(%("past_chats")).at_path("data_type")
                              }
      end
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

    context "without login" do
      let(:current_user) { nil }

      it { expect { subject }.to change(Video, :count).by(0) }
      it { expect { subject }.to change(Chat, :count).by(0) }
    end
  end

  describe "perform :message" do
    subject { perform :message, message: message }

    let(:message) { "message" }
    before { subscribe room_key: room.key }
    it { expect { subject }.to change(Chat, :count).by(1) }

    context "without login" do
      let(:current_user) { nil }

      it { expect { subject }.to change(Chat, :count).by(0) }
    end
  end

  describe "perform :exit_force" do
    subject { perform :exit_force, user_id: another_user.id }

    let(:another_user) { create(:user1) }
    let(:user_room_log) { create(:user_room_log, user: another_user, room: room, exit_at: nil) }
    let(:another_target) { RoomChannel.broadcasting_for([RoomChannel.channel_name, user_room_log.uuid]) }

    before {
      user_room_log.save!
      subscribe room_key: room.key
    }

    it "expect to have broadcast with error" do
      expect { subject }.to have_broadcasted_to(another_target).with { |data|
                              expect(data).to be_json_eql(%("error")).at_path("data_type")
                              expect(data).to be_json_eql(%("force exit")).at_path("data/message")
                            }
    end
    it { expect { subject }.to change(BanReport, :count).by(1) }
    it { expect { subject }.to change(Chat, :count).by(1) }
    it { expect { subject }.to change { room.online_users.count }.by(-1) }

    context "without login" do
      let(:current_user) { nil }

      it { expect { subject }.to change(BanReport, :count).by(0) }
      it { expect { subject }.to change(Chat, :count).by(0) }
      it { expect { subject }.to change { room.online_users.count }.by(0) }
    end
  end
end
