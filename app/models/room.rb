class Room < ApplicationRecord
  has_many :videos

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

  def get_now_playing_video
    last_video = videos.order(:video_start_time).last
    if last_video.blank?
      nil
    else
      (last_video.video_end_time > Time.now.utc) ? last_video : nil
    end
  end
end
