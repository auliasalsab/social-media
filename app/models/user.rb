class User < ApplicationRecord
  has_secure_password

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
      email: self.email,
      refres_token: self.refres_token
    }
  end
end
