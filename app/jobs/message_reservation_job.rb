class MessageReservationJob < ApplicationJob
  queue_as :default

  def perform(type, message, room)
    Chat.create! room: room,
                 chat_type: type,
                 message: message
  end
end
