# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    seed = Seed.new
    seed.clear_db
    seed.generate_boards
  end

  def clear_db
    User.destroy_all
    Group.destroy_all
    Message.destroy_all
    ApiKey.destroy_all
  end

  def generate_boards
    users = []
    20.times do
      name = Faker::Fallout.unique.character
      user = User.create!(
        name: name,
        email: "#{name}@vaulttec.com",
        password: "warneverchanges"
      )
      users.push(user)
    end
    10.times do
      group = Group.create!(
        name: Faker::Fallout.faction,
        description: Faker::Fallout.quote
      )
      10.times do
        message = Message.create!(
          group: group,
          user: users[Random.rand(users.length)],
          content: Faker::Fallout.quote
        )
      end
    end
  end
end

Seed.begin
