require "rails_helper"

describe BanReport, type: :model do
  it "is valid with correct param" do
    ban_report = build(:ban_report)
    expect(ban_report).to be_valid
  end
end
