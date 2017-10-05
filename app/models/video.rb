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
    results = service.list_videos("snippet, contentDetails", opt)
    item = results.items[0]
    title = item.snippet.title
    duration = change_duration_format(item.content_details.duration)

    create! room: Room.find(room_id),
            youtube_video_id: youtube_video_id,
            movie_start_time: Time.now.to_s(:db),
            title: title,
            duration: duration
  end

  def self.change_duration_format(duraction)
    hour = get_time(duraction, "H")
    minitue = get_time(duraction, "M")
    second = get_time(duraction, "S")
    hour + ":" + minitue + ":" + second
  end

  def self.get_time(duraction, target)
    regexp = Regexp.new("[0-9]+" + target)
    items = duraction.match(regexp)
    items.blank? ? "0" : items[0].delete(target)
  end

  private_class_method :change_duration_format
  private_class_method :get_time
end
