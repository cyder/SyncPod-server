class UserRoomLog < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room
  validates :uuid, uniqueness: true, allow_nil: true
  before_create :set_uuid
  before_create :set_entry_at
  after_create :send_enter_message
  after_update :send_exit_message, if: proc { |log| log.exit_at_before_last_save.blank? && log.exit_at.present? }

  scope :online, -> { where(exit_at: nil).where(updated_at: 1.hour.ago..Time.current) }

  def exit
    update! exit_at: Time.now.utc
  end

  private

    def set_uuid
      self.uuid = SecureRandom.uuid
    end

    def set_entry_at
      if entry_at.nil?
        self.entry_at = Time.now.utc
      end
    end

    def send_enter_message
      return if user.blank? || self.class.online.where(user: user).count > 1

      message = user.name + "さんが入室しました。"
      room.chats.create! chat_type: "login", message: message
    end

    def send_exit_message
      return if user.blank? || self.class.online.where(user: user).present?

      message = user.name + "さんが退室しました。"
      room.chats.create! chat_type: "login", message: message
    end
end
