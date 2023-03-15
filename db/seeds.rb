# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

50.times do
  Post.create(
    caption: Faker::Quote.most_interesting_man_in_the_world,
    post_type: 1,
    user_id: 1
  )
end
#   Character.create(name: "Luke", movie: movies.first)
