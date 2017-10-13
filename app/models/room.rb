class Room < ApplicationRecord
  has_many :videos
  has_many :chats

  def add_video(youtube_video_id)
    video_start_time = calc_video_start_time

    result = Youtube.find(youtube_video_id)
    snippet = result.snippet
    duration = VideoDuration.new(result.content_details.duration)

    Video.create! room: self,
                  youtube_video_id: youtube_video_id,
                  channel_title: snippet.channel_title,
                  thumbnail_url: snippet.thumbnails.medium.url,
                  duration: duration.text,
                  description: snippet.description,
                  published: snippet.published_at,
                  video_start_time: video_start_time.to_s(:db),
                  video_end_time: duration.video_end_time(video_start_time).to_s(:db),
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
end
