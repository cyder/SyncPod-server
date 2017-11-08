require "rails_helper"

describe UserRoomLog, type: :model do
  it "is valid with correct param" do
    log = build(:user_room_log)
    expect(log).to be_valid
  end
end
