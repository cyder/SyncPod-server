FactoryBot.define do
  factory :user_room_log do
    user
    room
    uuid { SecureRandom.uuid }
    entry_at "2017-10-27 03:38:43"
    exit_at "2017-10-27 03:38:43"
  end
end
