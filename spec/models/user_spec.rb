require "rails_helper"

describe User do
  it "is valid with correct param" do
    user = build(:user)
    expect(user).to be_valid
  end

  describe "after_create" do
    let(:user) { build(:user) }

    it "is update access token" do
      old_access_token = user.access_token
      user.save!
      expect(user.access_token).not_to eq old_access_token
    end
  end
end
