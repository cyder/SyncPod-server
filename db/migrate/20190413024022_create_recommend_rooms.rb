class CreateRecommendRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :recommend_rooms do |t|
      t.references :room, foreign_key: true, null: false, unique: true

      t.timestamps
    end
  end
end
