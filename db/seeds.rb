# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
# end



   if User.all.count >= 50
  return
   end
50.times do |n|
  name = Faker::FunnyName.two_word_name

  user = User.create!(full_name: username = "#{name.parameterize(separator: '_')}#{n}",
                      email: "#{username}#{n}@example.org",
                      password: 'foobar')
                      puts "users seeded"
 end