# user seeder
User.create(
  [
    { name: "ashari", email: "ashari@gmail.com", password: "123456" },
    { name: "aulia", email: "aulia@gmail.com", password: "123456" },
    { name: "userlain", email: "userlain@gmail.com", password: "123456" }
  ]
)

50.times do
  User.create(
    name: Faker::Name.first_name,
    email: "#{Faker::Name.first_name.downcase}@gmail.com",
    password: "123456"
  )
end
# end user seeder

# profile seeder
Profile.create(
  [
    {
      user_id: 1,
      phone_number: "0854326788",
      dob: "2023-02-03",
      gender: 1,
      bio: "bio ashari"
    },
    {
      user_id: 2,
      phone_number: "0854326788",
      dob: "2023-02-03",
      gender: 2,
      bio: "bio aulia"
    },
    {
      user_id: 3,
      phone_number: "0854326788",
      dob: "2023-02-03",
      gender: 2,
      bio: "bio user lain"
    }
  ]
)

50.times do |n|
  @n = n+4
  Profile.create(
    user_id: @n,
    phone_number: "0854326788",
    dob: "2023-02-03",
    gender: 1,
    bio: Faker::Marketing.buzzwords
  )
end
# end profile seeder

# create post
10.times do
  Post.create(
    caption: Faker::Quote.most_interesting_man_in_the_world,
    post_type: 1,
    user_id: 1
  )
end

10.times do
  Post.create(
    caption: Faker::Quote.most_interesting_man_in_the_world,
    post_type: 2,
    user_id: 2
  )
end


10.times do
  Post.create(
    caption: Faker::Quote.most_interesting_man_in_the_world,
    post_type: 2,
    user_id: 3
  )
end
# end add post

Comment.create(
  [
    {
      comment_text: Faker::Markdown.emphasis,
      user_id: 1,
      post_id: 3,
      parent_id: nil
    },
    {
      comment_text: Faker::Markdown.emphasis,
      user_id: 2,
      post_id: 3,
      parent_id: nil
    },
    {
      comment_text: Faker::Markdown.emphasis,
      user_id: 10,
      post_id: 3,
      parent_id: 2 
    },
    {
      comment_text: Faker::Markdown.emphasis,
      user_id: 10,
      post_id: 3,
      parent_id: 2 
    }
  ]
)

30.times do |n|
  no = n
  Follow.create(
    follower_id: no+4,
    following_id: 3
  )
end
30.times do |n|
  no = n
  Follow.create(
    follower_id: 3,
    following_id:no+5 
  )
end

10.times do |n|
  no = n
  Like.create(
    user_id: no+20,
    likeable_type: 'Post',
    likeable_id: 3
  )
end
