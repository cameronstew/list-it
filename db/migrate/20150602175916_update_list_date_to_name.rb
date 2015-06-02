class UpdateListDateToName < ActiveRecord::Migration
  def change
    rename_column :lists, :date, :name
  end
end
