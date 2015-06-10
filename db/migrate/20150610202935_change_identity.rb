class ChangeIdentity < ActiveRecord::Migration
  def change
    rename_column :identities, :first_name, :name
    remove_column :identities, :last_name, :string
  end
end
