class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

  validates :follower_id, presence: true
  validates :following_id, presence: true

  def new_attributes
    { follow: self.follow, created_at: self.created_at }
  end
end
