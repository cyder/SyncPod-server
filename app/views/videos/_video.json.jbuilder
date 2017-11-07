json.extract! video,
              :id,
              :youtube_video_id,
              :title,
              :channel_title,
              :thumbnail_url,
              :duration,
              :description,
              :view_count,
              :current_time
json.published video.published.strftime("%Y/%m/%d")
