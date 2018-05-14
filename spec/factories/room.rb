FactoryBot.define do
  factory :room do
    name "MyString"
    description "MyText"
    create_user { FactoryBot.create(:user) }
  end

  factory :public_room, class: Room do
    name "public room"
    description "MyText"
    create_user { FactoryBot.create(:user) }
    public true
  end
end
