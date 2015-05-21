class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :oauth_user_id
      t.string :provider
      t.string :uid
      t.string :profile_pic
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
