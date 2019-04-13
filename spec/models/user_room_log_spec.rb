require "rails_helper"

describe UserRoomLog, type: :model do
  it "is valid with correct param" do
    log = build(:user_room_log)
    expect(log).to be_valid
  end

  describe "#online" do
    subject { UserRoomLog.online }

    let(:updated_at) { Time.now.utc }
    let(:log) { create(:user_room_log, exit_at: exit_at, updated_at: updated_at) }

    before { log.save! }

    context "when exit_at is nil" do
      let(:exit_at) { nil }

      it "returns a log" do
        expect(subject.size).to eq 1
      end

      context "and updated_at is out of date" do
        let(:updated_at) { Time.now.utc - 60 * 60 - 10 }

        it "did not returns a log" do
          expect(subject.size).to eq 0
        end
      end
    end

    context "when exit_at exsit" do
      let(:exit_at) { Time.now.utc - 10 }

      it "did not returns a log" do
        expect(subject.size).to eq 0
      end
    end
  end
end
