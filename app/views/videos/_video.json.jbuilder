json.extract! video,
              :id,
              :youtube_video_id,
              :title,
              :channel_title,
              :thumbnail_url,
              :duration,
              :description,
              :current_time
json.published video.published.strftime("%Y/%m/%d")
