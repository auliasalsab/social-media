class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :user_id, presence: true
  validates :likeable_type, presence: true
  validates :likeable_id, presence: true

  def new_attributes 
    {
      id: self.id,
      user: self.user,
      likeable_type: self.likeable_type,
      likeable_id: self.likeable_id,

      created_at: self.created_at,
    }
  end
end
