class Chat < ApplicationRecord
  belongs_to :room
  after_create_commit do
    AddMessageBroadcastJob.perform_later(self)
  end
end
