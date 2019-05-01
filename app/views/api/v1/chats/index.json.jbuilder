json.chats @chats do |chat|
  json.partial! "chats/chat", chat: chat
end
