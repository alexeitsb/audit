class ChangeDefaultValueOfEntityOnEntries < ActiveRecord::Migration
  def change
    change_column_default :entries, :entity, 2
  end
end
