class RecommendRoom < ApplicationRecord
  belongs_to :room
  validates :room, uniqueness: true
end
