class ChangeItemQuantityToString < ActiveRecord::Migration
  def change
    remove_column :items, :quantity
    add_column :items, :quantity, :string
  end
end
