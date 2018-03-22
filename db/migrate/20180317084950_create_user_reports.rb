class CreateUserReports < ActiveRecord::Migration[5.1]
  def change
    create_table :user_reports do |t|
      t.references :user
      t.text :message, null: false

      t.timestamps
    end
  end
end
