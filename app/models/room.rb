class Room < ApplicationRecord
  has_many :videos

  def add_video(youtube_video_id)
    video_start_time = calc_video_start_time

    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Settings.google.api_key

    opt = { id: youtube_video_id }
    results = service.list_videos("snippet, contentDetails", opt)
    item = results.items[0]
    snippet = item.snippet
    duration = item.content_details.duration
    video_end_time = calc_video_end_time(video_start_time, duration)

    Video.create! room: self,
                  youtube_video_id: youtube_video_id,
                  channel_title: snippet.channel_title,
                  thumbnail_url: snippet.thumbnails.medium.url,
                  duration: duration,
                  description: snippet.description,
                  published: snippet.published_at,
                  video_start_time: video_start_time.to_s(:db),
                  video_end_time: video_end_time.to_s(:db),
                  title: snippet.title
  end

  def calc_video_start_time
    last_movie = videos.order(:video_start_time).last
    now = Time.now.utc
    if last_movie.blank?
      video_start_time = now
    else
      last_movie_end_time = last_movie.video_end_time
      video_start_time = (last_movie_end_time > now) ? last_movie_end_time : now
    end
    (video_start_time + Settings.movie.interval)
  end

  def now_playing_video
    condition = "video_end_time > '" + Time.now.utc.to_s(:db) + "'"
    now_play_video = videos.order(:video_end_time).where(condition).first
    if now_play_video.blank?
      nil
    else
      now_play_video
    end
  end

  def play_list
    condition = "video_start_time > '" + Time.now.utc.to_s(:db) + "'"
    videos.order(:video_start_time).where(condition)
  end

  private

    def calc_video_end_time(video_start_time, duration)
      hour = get_time(duration, "H")
      min = get_time(duration, "M")
      sec = get_time(duration, "S")
      video_start_time + sec + min * 60 + hour * 60 * 60
    end

    def get_time(duration, target)
      regexp = Regexp.new("[0-9]+" + target)
      items = duration.match(regexp)
      items.blank? ? 0 : items[0].delete(target).to_i
    end
end
