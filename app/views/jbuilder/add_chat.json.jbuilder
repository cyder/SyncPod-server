json.data_type "add_chat"
json.data do
  json.chat do
    json.extract! chat, :id, :room_id, :message
    json.created_at chat.created_at.strftime("%Y/%m/%d %H:%M:%S")
  end
end
