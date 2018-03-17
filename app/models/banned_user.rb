class BannedUser < ApplicationRecord
  belongs_to :target_user, class_name: "User"
  belongs_to :report_user, class_name: "User"
  belongs_to :room
  validates :expiration_at, presence: true
end
