json.extract! chat, :id, :room_id, :chat_type, :message
json.created_at chat.created_at.strftime("%Y/%m/%d %H:%M:%S")
if chat.user.present?
  json.user do
    json.partial! chat.user
  end
end
