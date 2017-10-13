class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :room, null: false
      t.string :chat_type, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
