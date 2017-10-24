json.data_type "add_chat"
json.data do
  json.chat do
    json.partial! chat
    if chat.user.present?
      json.user do
        json.partial! chat.user
      end
    end
  end
end
