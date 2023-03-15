class User < ApplicationRecord
  has_secure_password
  # has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :follower, class_name: 'Follow', dependent: :destroy, foreign_key: 'follower_id'
  has_many :following, class_name: 'Follow', dependent: :destroy, foreign_key: 'following_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :email,
            presence: true,
            length: {
              maximum: 255
            },
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
            }
  validates :password_digest, presence: true
  
  def new_attributes
    {
      id: self.id,
      name: self.name,
      email: self.email
    }
  end
end
