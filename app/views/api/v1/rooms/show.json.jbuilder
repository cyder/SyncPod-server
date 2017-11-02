json.room do
  json.partial! @room
  json.now_playing_video @room.now_playing_video
  json.last_played_video @room.last_played_video
end
