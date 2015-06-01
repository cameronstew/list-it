class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :name
      t.string :password_digest
      t.string :name
      t.string :email
      
      t.timestamps null: false
    end
  end
end
