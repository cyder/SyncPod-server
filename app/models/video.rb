require "google/apis/youtube_v3"

class Video < ApplicationRecord
  belongs_to :room
  after_create_commit { AddVideoBroadcastJob.perform_later self }

  def self.add(room_id, youtube_video_id)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Settings.google.api_key

    opt = {
      id: youtube_video_id,
    }
    results = service.list_videos([:snippet, :contentDetails], opt)
    item = results.items[0]
    snippet = item.snippet
    title = snippet.title

    create! room: Room.find(room_id), youtube_video_id: youtube_video_id, movie_start_time: Time.now.to_s(:db)
  end
end
