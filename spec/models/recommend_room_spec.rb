require "rails_helper"

describe RecommendRoom do
  context "with correct param" do
    it "is valid" do
      recommend = create(:recommend_room)
      expect(recommend).to be_valid
    end
  end

  context "with duplicated room" do
    let(:room) {
      create(:public_room).tap { |room|
        create(:recommend_room, room: room)
      }
    }

    it "is invalid" do
      duplicated = build(:recommend_room, room: room)
      duplicated.valid?
      expect(duplicated.errors[:room].size).to eq 1
    end
  end

  context "with not public room" do
    let(:room) { create(:room, public: false) }

    it "is invalid" do
      duplicated = build(:recommend_room, room: room)
      duplicated.valid?
      expect(duplicated.errors[:room].size).to eq 1
    end
  end
end
