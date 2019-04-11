class AddColumnToUserRoomLog < ActiveRecord::Migration[5.1]
  def change
    add_column :user_room_logs, :uuid, "char(36)", null: true
    add_column :user_room_logs, :ip_address, :text, null: true
    add_index :user_room_logs, :uuid
  end
end
