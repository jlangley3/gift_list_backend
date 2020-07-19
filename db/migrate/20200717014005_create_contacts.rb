class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.datetime :birthday
      t.string :kind, default: "friend"
      t.string :avatar, default: 'https://i.pinimg.com/originals/49/60/32/496032fb38b76e5bc22f8eb1d4a5d9be.jpg'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
