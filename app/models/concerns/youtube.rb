require "google/apis/youtube_v3"

class Youtube
  include AttrAccessorExtension

  attr_reader :youtube_video_id,
              :channel_title,
              :time,
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
    @time = VideoDuration.new(result.content_details.duration)
    @published = result.snippet.published_at
    @title = result.snippet.title
  end
end
