class AddUserRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :videos, :add_user, null: false
    add_foreign_key :videos, :users, column: :add_user_id
    add_reference :chats, :user, null: true
    add_foreign_key :chats, :users
  end
end
