class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :key, null: false, index: true
      t.text :description

      t.timestamps
    end
  end
end
