class AddIndexToVideo < ActiveRecord::Migration[5.1]
  def change
    add_index :videos, :video_start_time
  end
end
