require "rails_helper"

describe RecommendRoom do
  context "with correct param" do
    it "is valid" do
      recommend = create(:recommend_room)
      expect(recommend).to be_valid
    end
  end

  context "with duplicated room" do
    let(:room) { create(:room) }
    before { create(:recommend_room, room: room).save! }

    it "is invalid" do
      duplicated = build(:recommend_room, room: room)
      duplicated.valid?
      expect(duplicated.errors[:room].size).to eq 1
    end
  end
end
