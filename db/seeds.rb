User.create(
  [
    {
      name: 'ashari',
      email: 'asharimidana@gmail.com',
      password: '123456'
    },
    {
      name: 'aulia',
      email: 'aulia@gmail.com',
      password: '123456'
    },
    {
      name: 'user lain',
      email: 'userlain@gmail.com',
      password: '123456'
    }
  ]
)

50.times do
  Post.create(
    caption: Faker::Quote.most_interesting_man_in_the_world,
    post_type: 1,
    user_id: 1
  )
end


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
      user_id: 1,
      post_id: 3,
      parent_id: 2 
    },
    {
      comment_text: Faker::Markdown.emphasis,
      user_id: 2,
      post_id: 3,
      parent_id: 2 
    }
  ]
)
