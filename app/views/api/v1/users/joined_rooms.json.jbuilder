json.joined_rooms do
  json.array!(@rooms) do |room|
    json.partial! room
  end
end
