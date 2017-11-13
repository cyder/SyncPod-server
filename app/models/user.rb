class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  has_many :videos, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :user_room_logs, dependent: :destroy

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    # TODO: !つけるならsave!にしなさい
    save
  end

  def joined_room
    Room.joins(:user_room_logs).
      where(["user_room_logs.user_id = ?", self.id]).
      group("user_room_logs.room_id").
      order("MAX(user_room_logs.entry_at) DESC")
  end
end
