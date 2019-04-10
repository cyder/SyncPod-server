class UserRoomLog < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :entry_at, presence: true
  validates :uuid, uniqueness: true, allow_nil: true
end
