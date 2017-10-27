FactoryBot.define do
  factory :video do
    youtube_video_id "AS4q9yaWJkI"
    video_start_time "2017-10-27 03:38:43"
    video_end_time "2017-10-27 03:42:43"
    room { FactoryBot.build(:room) }
    add_user { FactoryBot.build(:user) }
  end
end
