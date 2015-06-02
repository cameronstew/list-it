class UpdateNameDataTypeToString < ActiveRecord::Migration
  def change
    change_column :lists, :name, :string
  end
end
