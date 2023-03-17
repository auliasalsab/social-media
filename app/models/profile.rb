class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  def new_attributes
    gender = %w[laki-laki perempuan]
    return(
      {
        id: self.id,
        user: {
          id: self.user.id,
          name: self.user.name
        },
        phone_number: self.phone_number,
        dob: self.dob,
        gender: gender[self.gender - 1],
        bio: self.bio,
        created_at: self.created_at
      }
    )
  end
end
