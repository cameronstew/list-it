class ChangeCategoryFromStringToInteger < ActiveRecord::Migration
  def change
    remove_column :items, :category
    add_column :items, :category, :integer, default: 0
  end
end
