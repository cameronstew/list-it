class UpdateIdentityModel < ActiveRecord::Migration
  def change
    rename_column :identities, :name, :first_name
    add_column :identities, :last_name, :string
  end
end
