FactoryBot.define do
  factory :recommend_room do
    room { FactoryBot.create(:public_room) }
  end
end
