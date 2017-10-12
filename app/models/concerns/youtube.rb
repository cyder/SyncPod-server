class Youtube
  @service = Google::Apis::YoutubeV3::YouTubeService.new
  @service.key = Settings.google.api_key

  def self.find(id)
    opt = { id: id }
    results = @service.list_videos("snippet, contentDetails", opt)
    results.items[0]
  end
end
