class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.references :room, null: false
      t.string :youtube_video_id, null: false
      
      t.datetime :movie_start_time, null: false

      t.timestamps
    end
    add_foreign_key :videos, :rooms
  end
end
