json.data_type "past_chats"
json.data do
  json.past_chats chats do |chat|
    json.partial! chat
  end
end
