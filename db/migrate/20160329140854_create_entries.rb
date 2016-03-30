class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user, index: true
      t.string :description
      t.decimal :value, precision: 8, scale: 2, default: 0
      t.text :note
      t.integer :entity, default: 1
      t.date :at

      t.timestamps null: false
    end
  end
end
