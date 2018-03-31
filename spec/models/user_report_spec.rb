require "rails_helper"

describe UserReport, type: :model do
  it "is valid with correct param" do
    user_report = build(:user_report)
    expect(user_report).to be_valid
  end
end
