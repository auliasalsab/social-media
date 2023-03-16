class Comment < ApplicationRecord
  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :post
  belongs_to :parent, class_name: "Comment", foreign_key: "parent_id", optional: true
  has_many :children, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy

  validates :comment_text, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :parent_id, presence: true

  def new_attributes 
    {
    id: self.id,
    user: self.user,
    post: self.post
    parent_id: self.parent_id,

    created_at: self.created_at,

    }
  end 
end

