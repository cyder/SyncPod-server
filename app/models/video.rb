require "google/apis/youtube_v3"

class Video < ApplicationRecord
  belongs_to :room
  after_create_commit do
    AddVideoBroadcastJob.perform_later(self)
    StartVideoBroadcastJob.set(wait_until: self.video_start_time).perform_later(self)
  end

  def self.add(room_id, youtube_video_id)
    video_start_time = calc_video_start_time(room_id)

    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Settings.google.api_key

    opt = {
      id: youtube_video_id,
    }
    results = service.list_videos("snippet, contentDetails", opt)
    item = results.items[0]
    title = item.snippet.title
    video_end_time = calc_video_end_time(video_start_time, item.content_details.duration)

    create! room: Room.find(room_id),
            youtube_video_id: youtube_video_id,
            video_start_time: video_start_time.to_s(:db),
            video_end_time: video_end_time.to_s(:db),
            title: title
  end

  def self.get_now_playing_video(room_id)
    last_video = Video.order(video_start_time: :desc).find_by(room_id: room_id)
    if last_video.blank?
      nil
    else
      (last_video.video_end_time > Time.now.utc) ? last_video : nil
    end
  end

  def self.calc_video_start_time(room_id)
    last_movie = Video.order(video_start_time: :desc).find_by(room_id: room_id)
    now = Time.now.utc
    if last_movie.blank?
      video_start_time = now
    else
      last_movie_end_time = last_movie.get_end_time
      video_start_time = (last_movie_end_time > now) ? last_movie_end_time : now
    end
    (video_start_time + Settings.movie.interval)
  end

  def self.calc_video_end_time(video_start_time, duration)
    hour = get_time(duration, "H")
    min = get_time(duration, "M")
    sec = get_time(duration, "S")
    video_start_time + sec + min * 60 + hour * 60 * 60
  end

  def self.get_time(duration, target)
    regexp = Regexp.new("[0-9]+" + target)
    items = duration.match(regexp)
    items.blank? ? 0 : items[0].delete(target).to_i
  end

  private_class_method :calc_video_start_time
  private_class_method :calc_video_end_time
  private_class_method :get_time
end
