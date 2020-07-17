class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :repeating, default: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
