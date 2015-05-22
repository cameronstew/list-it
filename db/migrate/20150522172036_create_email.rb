class CreateEmail < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :recipient_email
      t.string :recipient_name
      t.string :message
      t.integer :list_id
    end
  end
end
