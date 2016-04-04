class AddResponsibleIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :responsible_id, :integer, after: :user_id

    add_index :entries, :responsible_id
  end
end
