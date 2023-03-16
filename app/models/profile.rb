class Profile < ApplicationRecord
    belongs_to :user
    
    validates :user_id, presence: true
    validates :phone_number, presence: true
    validates :dob, presence: true
    validates :gender, presence: true
    validates :bio, presence: true


    def new_attributes 
      {
        id: self.id,
        user: self.user,
        phone_number: self.phone_number,
        dob: self.dob,
        gender: self.gender,
        bio: self.bio,

        created_at: self.created_at,
    }
    end
end
