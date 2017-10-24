require "google/apis/youtube_v3"

class Video < ApplicationRecord
  belongs_to :room
  belongs_to :add_user, class_name: "User"
  after_create_commit do
    AddVideoBroadcastJob.perform_later(self)
    StartVideoBroadcastJob.set(wait_until: self.video_start_time).perform_later(self)
  end

  def current_time
    now = Time.now.utc
    if now > video_end_time
      nil
    elsif now < video_start_time
      0
    else
      (now - video_start_time).to_i
    end
  end
end
