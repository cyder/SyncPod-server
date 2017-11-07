class UserRoomLog < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :entry_at, presence: true
end
