json.extract! @result,
              :next_page_token,
              :prev_page_token,
              :total_results,
              :results_per_page
json.items @result.items do |item|
  json.partial! "youtube_video", video: item
end
