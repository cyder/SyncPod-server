require "google/apis/youtube_v3"

class Youtube
  include AttrAccessorExtension

  attr_reader :youtube_video_id,
              :channel_title,
              :time,
              :thumbnail_url,
              :published,
              :description,
              :view_count,
              :title

  def initialize(id)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Settings.google.api_key
    result = service.list_videos("snippet, contentDetails, statistics", { id: id }).items[0]

    @youtube_video_id = id
    @channel_title = result.snippet.channel_title
    @thumbnail_url = result.snippet.thumbnails.medium.url
    @time = VideoDuration.new(result.content_details.duration)
    @published = result.snippet.published_at
    @description = result.snippet.description
    @view_count = result.statistics.view_count
    @title = result.snippet.title
  end
end
