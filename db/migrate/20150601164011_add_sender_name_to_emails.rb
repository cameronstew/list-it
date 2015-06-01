class AddSenderNameToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :sender_name, :string
  end
end
