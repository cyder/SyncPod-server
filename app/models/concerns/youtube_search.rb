require "google/apis/youtube_v3"

class YoutubeSearch
  attr_reader :items,
              :next_page_token,
              :prev_page_token,
              :total_results,
              :results_per_page

  def initialize(keyword, page_token = nil)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV["GOOGLE_API_KEY"]

    opt = {
      q: keyword,
      type: "video",
      page_token: page_token,
      max_results: 10,
      video_syndicated: true,
    }

    results = service.list_searches("id", opt)
    @items = Parallel.map(results.items, in_threads: results.items.size) do |one_letter|
      YoutubeVideo.new one_letter.id.video_id
    end
    @next_page_token = results.next_page_token
    @prev_page_token = results.prev_page_token
    @total_results = results.page_info.total_results
    @results_per_page = results.page_info.results_per_page
  end
end
