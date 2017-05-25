class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string, after: :role
  end
end
