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
    # comment = self.comments.where(parent_id: data)
    # comment_count = self.comments.count
    return(
      {
        id: self.id,
        # user: {id: self.user["id"], name: self.user["name"]},
        # caption: self.caption,
        comment_text: self.comment_text,
        user_id: self.user_id,
        post_id: self.post_id,
        # parent_id: child_comment(self.post_id),
        # comment: new_comment_attributes(comment),
        # comment: new_comment_attributes(comment),
        # type: type_post(self.post_type - 1),
        # total_reply_commnet: child_comment(self.post_id),
        created: self.created_at
      }
    )
  end

  def child_comment(child_id)
    Comment.where(parent_id: child_id)
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



end
