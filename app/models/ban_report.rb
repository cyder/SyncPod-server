class BanReport < ApplicationRecord
  belongs_to :target, class_name: "User"
  belongs_to :reporter, class_name: "User"
  belongs_to :room
  validates :expiration_at, presence: true

  scope :valid, -> do
    where("expiration_at > ?", Time.now.utc)
  end
end
