class Profile < ApplicationRecord
  validates :user_id, uniqueness: true

  belongs_to :user
  enum gender: { unselected: 0, man: 1, woman: 2 }
end
