class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user, index: true
      t.string :description
      t.decimal :value
      t.text :note
      t.integer :entity, default: 1

      t.timestamps null: false
    end
  end
end
