class AddDefaultValueToShopped < ActiveRecord::Migration
  def change
    change_column :lists, :shopped, :boolean, :default => false
  end
end
