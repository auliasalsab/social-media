class Post < ApplicationRecord
    belongs_to :user

    has_many :likes, as: :likeable 
    has_many :comments, dependent: :destroy

    validates :user_id, presence: true
    validates :post_type, presence: true
    validates :caption, presence: true

    def new_attributes 
        {
        id: self.id,
        caption: self.caption,
        post_type: self.post_type,
        user: self.user,

        created_at: self.created_at,

        }
        
    end 
end
