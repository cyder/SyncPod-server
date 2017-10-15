json.data_type "now_playing_video"
json.data do
  if video.present?
    json.video do
      json.partial! video
    end
  end
end
