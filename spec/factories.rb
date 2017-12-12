FactoryBot.define do
  factory :api_key do
    access_token "MyString"
  end
  factory(:group) do
    name(Faker::Fallout.faction)
    description(Faker::Fallout.quote)
  end

  factory(:user) do
    name(Faker::Fallout.unique.character)
    email(Faker::Fallout.unique.location)
  end

  factory(:message) do
    group
    user
    content(Faker::Fallout.quote)
  end
end
