FactoryBot.define do
  factory :user_chat, class: Chat do
    chat_type "user"
    message "MyString"
    room { FactoryBot.build(:room) }
    user { FactoryBot.build(:user) }
  end
end
