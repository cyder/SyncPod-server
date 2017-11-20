require "google/apis/youtube_v3"

class YoutubeSearch
  attr_reader :items,
              :next_page_token,
              :prev_page_token,
              :total_results,
              :results_per_page

  def initialize(keyword, page_token = nil)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = Settings.google.api_key

    opt = {
      q: keyword,
      type: "video",
      page_token: page_token,
      max_results: 10,
      video_syndicated: true,
    }

    results = service.list_searches("id", opt)
    @items = results.items.map { |item| YoutubeVideo.new item.id.video_id }
    @next_page_token = results.next_page_token
    @prev_page_token = results.prev_page_token
    @total_results = results.page_info.total_results
    @results_per_page = results.page_info.results_per_page
  end
end
