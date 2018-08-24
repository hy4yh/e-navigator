class Profile < ApplicationRecord
  belongs_to :user
  enum gender: { unselected: 0, man: 1, woman: 2 }
end
