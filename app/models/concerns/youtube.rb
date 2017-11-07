require "google/apis/youtube_v3"

class Youtube
  include AttrAccessorExtension

  attr_reader :youtube_video_id,
              :channel_title,
              :duration,
              :thumbnail_url,
              :published,
              :title

  def initialize(id)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Settings.google.api_key
    result = service.list_videos("snippet, contentDetails", { id: id }).items[0]

    @youtube_video_id = id
    @channel_title = result.snippet.channel_title
    @thumbnail_url = result.snippet.thumbnails.medium.url
    @duration = VideoDuration.new(result.content_details.duration)
    @published = result.snippet.published_at
    @title = result.snippet.title
  end

  def create_params
    [
      [:youtube_video_id, @youtube_video_id],
      [:channel_title, @channel_title],
      [:thumbnail_url, @thumbnail_url],
      [:duration, @duration.text],
      [:published, @published],
      [:title, @title],
    ]
  end
end
