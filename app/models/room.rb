class Room < ApplicationRecord
  has_many :videos, dependent: :destroy
  has_many :chats, dependent: :destroy
  validates :key, uniqueness: true

  before_create :set_room_key

  def add_video(youtube_video_id, user)
    video_start_time = calc_video_start_time

    result = Youtube.find(youtube_video_id)
    snippet = result.snippet
    duration = VideoDuration.new(result.content_details.duration)

    # TODO: youtubeのAPIに依存して気持ち悪いことになってるのでAPIをyoutube modelでwrapした方がよさそう
    Video.create! room: self,
                  youtube_video_id: youtube_video_id,
                  channel_title: snippet.channel_title,
                  thumbnail_url: snippet.thumbnails.medium.url,
                  duration: duration.text,
                  description: snippet.description,
                  published: snippet.published_at,
                  video_start_time: video_start_time.to_s(:db),
                  video_end_time: duration.video_end_time(video_start_time).to_s(:db),
                  title: snippet.title,
                  add_user: user
  end

  # TODO: メソッド名は返す値を示した方がよさげ
  def calc_video_start_time
    # TODO: 毎回呼んでるっぽいのでindex貼るべき
    last_video = videos.order(:video_start_time).last
    now = Time.now.utc
    video_start_time = if last_video.blank?
                         now
                       else
                         [last_video.video_end_time, now].max
                       end
    (video_start_time + Settings.movie.interval)
  end

  def now_playing_video
    # 1つのroomでは複数のvideoを同時再生されない
    videos.not_ended_yet.order_by_end.take
  end

  def play_list
    videos.not_started_yet.order_by_start
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
