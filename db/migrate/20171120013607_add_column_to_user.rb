class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :self_introduction, :text
    add_column :users, :icon, :string
  end
end
