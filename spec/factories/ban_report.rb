FactoryBot.define do
  factory :ban_report do
    target { FactoryBot.create(:user1) }
    reporter { FactoryBot.create(:user2) }
    room
    expiration_at "2017-10-27 03:38:43"
  end
end
