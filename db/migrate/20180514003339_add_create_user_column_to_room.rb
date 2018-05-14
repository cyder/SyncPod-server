class AddCreateUserColumnToRoom < ActiveRecord::Migration[5.1]
  def change
    add_reference :rooms, :create_user, foreign_key: { to_table: :users }
  end
end
