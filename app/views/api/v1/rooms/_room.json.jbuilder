json.extract! room,
              :id,
              :name,
              :description,
              :key,
              :public
json.now_playing_video room.now_playing_video
json.last_played_video room.last_played_video
json.online_users do
  json.array!(room.online_users) do |user|
    json.partial! user
  end
end
json.create_user do
  json.partial! room.create_user
end
