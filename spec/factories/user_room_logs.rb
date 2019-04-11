FactoryBot.define do
  factory :user_room_log do
    user
    room
    ip_address "0.0.0.0"
    entry_at "2017-10-27 03:38:43"
    exit_at "2017-10-27 03:38:43"
  end
end
