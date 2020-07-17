class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.float :price
      t.boolean :given, default: true
      t.integer :rating, default: 0
      t.string :link
      t.references :event, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
