class AddColumnToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :public, :boolean, default: false, null: false
  end
end
