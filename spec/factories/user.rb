FactoryBot.define do
  factory :user do
    email "user@example.com"
    password "password"
    name "MyString"
    initialize_with { User.find_or_create_by(email: email) }
  end

  factory :user1, class: User do
    email "user1@example.com"
    password "password"
    name "MyString"
    initialize_with { User.find_or_create_by(email: email) }
  end

  factory :user2, class: User do
    email "user2@example.com"
    password "password"
    name "MyString"
    initialize_with { User.find_or_create_by(email: email) }
  end

  factory :user3, class: User do
    email "user3@example.com"
    password "password"
    name "MyString"
    initialize_with { User.find_or_create_by(email: email) }
  end
end
