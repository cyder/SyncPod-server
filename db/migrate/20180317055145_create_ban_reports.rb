class CreateBanReports < ActiveRecord::Migration[5.1]
  def change
    create_table :ban_reports do |t|
      t.references :target_user, references: :user
      t.references :report_user, references: :user
      t.references :room
      t.datetime :expiration_at, null: false

      t.timestamps
    end
  end
end
