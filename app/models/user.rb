class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  has_many :videos, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :user_room_log, dependent: :destroy

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    # TODO: !つけるならsave!にしなさい
    save
  end
end
