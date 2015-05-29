class UpdateListAttributes < ActiveRecord::Migration
  def change
    rename_column :lists, :complete, :shopped
    add_column :lists, :author, :string
  end
end
