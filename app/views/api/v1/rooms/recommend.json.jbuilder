json.rooms do
  json.array!(@rooms) do |room|
    json.partial! room
  end
end
