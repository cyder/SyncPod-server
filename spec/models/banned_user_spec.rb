require "rails_helper"

describe BannedUser, type: :model do
  it "is valid with correct param" do
    banned_user = build(:banned_user)
    expect(banned_user).to be_valid
  end
end
