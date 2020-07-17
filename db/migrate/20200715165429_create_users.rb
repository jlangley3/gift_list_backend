class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name 
      t.string :avatar, default: 'https://i.pinimg.com/originals/49/60/32/496032fb38b76e5bc22f8eb1d4a5d9be.jpg'

      t.timestamps
    end
  end
end
