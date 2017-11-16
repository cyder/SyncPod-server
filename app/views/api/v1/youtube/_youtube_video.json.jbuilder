json.extract! video,
              :youtube_video_id,
              :title,
              :channel_title,
              :thumbnail_url,
              :description,
              :view_count
json.duration video.time.text
json.published video.published.strftime("%Y/%m/%d")
