class CreateContactInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_interests do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :interest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
