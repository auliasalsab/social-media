class Comment < ApplicationRecord
   has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :post
  belongs_to :parent, class_name: "Comment", foreign_key: "parent_id", optional: true
  has_many :children, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
end
