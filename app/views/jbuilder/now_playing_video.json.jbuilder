json.data_type "now_playing_video"
json.data do
  if video.present?
    json.partial! video
  else
    nil
  end
end
