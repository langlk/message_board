FactoryBot.define do
  factory(:group) do
    name(Faker::Fallout.faction)
    description(Faker::Fallout.quote)
  end
end
