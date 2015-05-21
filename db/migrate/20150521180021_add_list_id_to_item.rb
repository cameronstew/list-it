class AddListIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :list_id, :integer
    add_column :items, :quantity, :integer

  end
end
