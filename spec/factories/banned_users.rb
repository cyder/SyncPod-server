FactoryBot.define do
  factory :banned_user do
    target_user { FactoryBot.create(:user1) }
    report_user { FactoryBot.create(:user2) }
    room
    expiration_at "2017-10-27 03:38:43"
  end
end
