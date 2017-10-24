json.data_type "add_video"
json.data do
  json.video do
    json.partial! video
  end
  json.add_user do
    json.partial! video.add_user
  end
end
