require "google/apis/youtube_v3"

class Video < ApplicationRecord
  belongs_to :room
  after_create_commit { AddVideoBroadcastJob.perform_later self }

  def self.add(room_id, youtube_video_id)
    movie_start_time = calc_movie_start_time(room_id)

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
            movie_start_time: movie_start_time,
            title: title,
            duration: duration
  end

  def self.calc_movie_start_time(room_id)
    last_movie = Video.order(movie_start_time: :desc).find_by(room_id: room_id)
    now = Time.now.utc
    if last_movie.blank?
      movie_start_time = now
    else
      last_movie_end_time = last_movie.movie_start_time +
                            last_movie.duration.sec +
                            last_movie.duration.min * 60 +
                            last_movie.duration.hour * 60 * 60
      movie_start_time = (last_movie_end_time > now) ? last_movie_end_time : now
    end
    (movie_start_time + Settings.movie.interval).to_s(:db)
  end

  def self.change_duration_format(duration)
    hour = get_time(duration, "H")
    minitue = get_time(duration, "M")
    second = get_time(duration, "S")
    hour + ":" + minitue + ":" + second
  end

  def self.get_time(duration, target)
    regexp = Regexp.new("[0-9]+" + target)
    items = duration.match(regexp)
    items.blank? ? "0" : items[0].delete(target)
  end

  private_class_method :calc_movie_start_time
  private_class_method :change_duration_format
  private_class_method :get_time
end
