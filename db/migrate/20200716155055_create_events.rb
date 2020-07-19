class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.float :budget
      t.boolean :repeating, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
