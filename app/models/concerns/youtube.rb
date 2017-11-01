class Youtube
  # TODO: この書き方？？？？？？インスタンス変数？クラス変数？
  @service = Google::Apis::YoutubeV3::YouTubeService.new
  @service.key = Settings.google.api_key

  def self.find(id)
    opt = { id: id }
    results = @service.list_videos("snippet, contentDetails", opt)
    # TODO: nilが返ってくることはない？返ってくるのはYoutubeクラスのインスタンスなの？
    results.items[0]
  end
end
