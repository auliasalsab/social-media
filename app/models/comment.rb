class Comment < ApplicationRecord
  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :post
  belongs_to :parent,
             class_name: "Comment",
             foreign_key: "parent_id",
             optional: true
  has_many :children,
           class_name: "Comment",
           foreign_key: "parent_id",
           dependent: :destroy

  validates :comment_text, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  def get_post_by_id
    return(
      {
        id: self.id,
        post: self.post,
        user_id: self.user_id,
        like: self.likes.count,
        children_comment: self.children.map { |data| data.child_comment },
        comment_text: self.comment_text,
        created: self.created_at
      }
    )
  end

  def child_comment
    {
      parent_id: self.parent_id,
      post_id: self.post_id,
      id: self.id,
      like: self.likes.count,
      comment_text: self.comment_text
    }
  end
end
