require "rails_helper"

describe RecommendRoom do
  context "with correct param" do
    it "is valid" do
      recommend = create(:recommend_room)
      expect(recommend).to be_valid
    end
  end
end
