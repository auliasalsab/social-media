class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :caption, presence: true

  enum post_type: { 
    public_post: 1, 
    private_post: 2
  }

  def get_post_by_id
    # Binding.pry
    comment = self.comments.where(parent_id: nil).limit(2)
    comment_count = self.comments.count
    return(
      {
        id: self.id,
        user: {id: self.user["id"], name: self.user["name"]},
        caption: self.caption,
        total_comment: comment_count,
        total_like: self.likes.count,
        comment: new_comment_attributes(comment),
        type: self.post_type,
        created: self.created_at
      }
    )
  end

  def new_comment_attributes(datas)
    return(
      datas.map do |data|
        {
          id: data.id,
          comment_text: data.comment_text,
          user_id: self.user["id"],
          name_comment: self.user["name"],
          total_reply_commnet: child_comment(data.id),
          comment_date: data.created_at
        }
      end
    )
  end

  def child_comment(child_id)
    Comment.where(parent_id: child_id)
  end

  def new_attributes
    comment = self.comments.count
    return(
      {
        id: self.id,
        user: {id: self.user["id"], name: self.user["name"]},
        caption: self.caption,
        total_comment: comment,
        total_like: self.likes.count,
        type: type_post(self.post_type - 1),
        created: self.created_at
      }
    )
  end

  def type_post(data)
    x = %w[public private]
    return x[data]
  end
end
