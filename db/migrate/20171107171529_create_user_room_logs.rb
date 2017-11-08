class CreateUserRoomLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_room_logs do |t|
      t.references :user
      t.references :room
      t.datetime :entry_at, null: false
      t.datetime :exit_at

      t.timestamps
    end
  end
end
