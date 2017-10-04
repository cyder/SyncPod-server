class Video < ApplicationRecord
  belongs_to :room

  def self.add(room_id, video_id)
    create! room: Room.find(room_id), video_id: video_id, movie_start_time: Time.now
  end
end
