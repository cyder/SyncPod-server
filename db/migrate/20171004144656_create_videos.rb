class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.references :room, null: false
      t.string :youtube_video_id, null: false
      t.string :title
      t.string :channel_title
      t.string :thumbnail_url
      t.string :duration
      t.text :description
      t.datetime :published
      t.datetime :video_start_time, null: false
      t.datetime :video_end_time, null: false

      t.timestamps
    end
    add_foreign_key :videos, :rooms
  end
end
