class Follow < ApplicationRecord
    belongs_to :follower, class_name: 'User'

    validates :follower_id, presence: true
    validates :following_id, presence: true

end
