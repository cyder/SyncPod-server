class Room < ApplicationRecord
  has_many :videos, dependent: :destroy
  has_many :chats, dependent: :destroy
  validates :key, uniqueness: true

  before_create :set_room_key

  def add_video(youtube_video_id, user)
    video_start_time = calc_video_start_time

    youtube = Youtube.new(youtube_video_id)

    Video.create!(
      room: self,
      video_start_time: video_start_time,
      video_end_time: youtube.duration.video_end_time(video_start_time),
      add_user: user,
      **youtube.create_params.to_h,
    )
  end

  # TODO: メソッド名は返す値を示した方がよさげ
  def calc_video_start_time
    last_video = videos.order(:video_start_time).last
    now = Time.now.utc
    video_start_time = last_video.blank? ? now : [last_video.video_end_time, now].max
    (video_start_time + Settings.movie.interval)
  end

  def now_playing_video
    # 1つのroomでは複数のvideoを同時再生されない
    videos.not_ended_yet.order_by_end.take
  end

  def play_list
    videos.not_started_yet.order_by_start
  end

  def last_played_video
    videos.ended.order_by_end.last
  end

  def past_chats(num)
    chats.latest_by(num).reverse
  end

  private

    def set_room_key
      self.key = generate_key
    end

    def generate_key
      tmp_token = SecureRandom.urlsafe_base64(6)
      self.class.exists?(key: tmp_token) ? generate_key : tmp_token
    end
end
