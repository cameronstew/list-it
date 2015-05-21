class RemoveHstoreFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :items
  end
end
