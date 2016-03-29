class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :encrypted_password
      t.integer :role

      t.timestamps null: false
    end
  end
end
