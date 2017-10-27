FactoryBot.define do
  factory :user do
    email "user@example.com"
    password "password"
    name "MyString"
    initialize_with { User.find_or_create_by(email: email) }
  end
end
