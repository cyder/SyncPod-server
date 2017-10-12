json.data_type "play_list"
json.data do
  json.play_list videos do |video|
    json.partial! video
  end
end
