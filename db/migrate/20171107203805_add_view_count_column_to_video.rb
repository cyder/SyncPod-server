class AddViewCountColumnToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :view_count, :integer, limit: 5
  end
end
