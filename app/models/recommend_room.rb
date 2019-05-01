class RecommendRoom < ApplicationRecord
  belongs_to :room
  validates :room, uniqueness: true
  validate :must_belongs_to_public_room

  private

    def must_belongs_to_public_room
      unless room.public
        errors.add(:room, "must belongs to public room")
      end
    end
end
