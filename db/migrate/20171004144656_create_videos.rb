class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :video_lists do |t|
      t.references :room, null: false
      t.string :videoId
      t.time :movieStartTime

      t.timestamps
    end
    add_foreign_key :video_lists, :rooms
  end
end
