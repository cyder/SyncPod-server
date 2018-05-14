class Room < ApplicationRecord
  has_many :videos, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :user_room_logs, dependent: :destroy
  has_many :ban_reports, dependent: :destroy
  belongs_to :create_user, class_name: "User", optional: true
  validates :key, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true

  before_create :set_room_key

  scope :published, -> { where(public: true) }

  scope :order_by_online_user, -> {
    joins(:user_room_logs).
      merge(UserRoomLog.where(exit_at: nil)).
      group(:id).
      order("count(*) DESC")
  }

  def add_video(youtube_video_id, user)
    video_start_time = calc_video_start_time

    youtube_video = YoutubeVideo.new(youtube_video_id)

    Video.create!(
      room: self,
      duration: youtube_video.time.text,
      video_start_time: video_start_time,
      video_end_time: youtube_video.time.video_end_time(video_start_time),
      add_user: user,
      **youtube_video.to_h.except(:time),
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

  def online_users
    User.where(id: user_room_logs.where(exit_at: nil).select(:user_id).distinct)
  end

  def banned?(user)
    ban_reports.where(target: user).effective.present?
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
