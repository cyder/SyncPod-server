FactoryBot.define do
  factory :user_chat, class: Chat do
    chat_type "user"
    message "MyString"
    room
    user
  end
end
