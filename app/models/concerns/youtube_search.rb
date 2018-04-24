require "google/apis/youtube_v3"

class YoutubeSearch
  attr_reader :items,
              :next_page_token,
              :prev_page_token,
              :total_results,
              :results_per_page

  def initialize(keyword, page_token = nil)
    @items = []
    @next_page_token = page_token
    result = nil

    loop do
      result = fetch_video_search(keyword, @next_page_token)
      @items += fetch_video_details(result.items).reject do |item|
        item.restricted? || item.live?
      end
      @next_page_token = result.next_page_token
      @prev_page_token = result.prev_page_token if @prev_page_token.nil?
      @total_results = result.page_info.total_results if @total_results.nil?
      @results_per_page = @items.size
      break if @next_page_token.nil? || @results_per_page >= 10
    end
  end

  private

    def fetch_video_search(keyword, page_token)
      service = Google::Apis::YoutubeV3::YouTubeService.new
      service.key = ENV["GOOGLE_API_KEY"]

      opt = {
        q: keyword,
        type: "video",
        page_token: page_token,
        max_results: 10,
        video_syndicated: true,
      }

      service.list_searches("id", opt)
    end

    def fetch_video_details(items)
      Parallel.map(items, in_threads: items.size) do |one_letter|
        YoutubeVideo.new one_letter.id.video_id
      end
    end
end
