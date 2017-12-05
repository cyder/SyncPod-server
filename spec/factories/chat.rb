FactoryBot.define do
  factory :user_chat, class: Chat do
    chat_type "user"
    message "MyString"
    room
    user
  end

  factory :user_chat_with_emoji, class: Chat do
    chat_type "user"
    message "MyString💩"
    room
    user
  end
end
