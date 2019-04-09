class AddColumnToUserRoomLog < ActiveRecord::Migration[5.1]
  def change
    add_column :user_room_logs, :uuid, :text, null: true
  end
end
