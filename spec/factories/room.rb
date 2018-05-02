FactoryBot.define do
  factory :room do
    name "MyString"
    description "MyText"
  end

  factory :public_room, class: Room do
    name "public room"
    description "MyText"
    public true
  end
end
