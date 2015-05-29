class AddAuthorEmailToLists < ActiveRecord::Migration
  def change
    add_column :lists, :author_email, :string
  end
end
