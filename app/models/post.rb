class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy
  def comment_post(p)
  end

  def new_attributes
    {
      id: self.id,
      user: self.user["name"],
      caption: self.caption,
      # comment: Comment.search_comment(self.id),
      comment: Comment.find(1),
      type: self.post_type,
      created: self.created_at
    }
  end
end
