class CreateList < ActiveRecord::Migration
  def change
    ActiveRecord::Schema.define do
      enable_extension 'hstore' unless extension_enabled?('hstore')
      create_table :lists do |t|
        t.integer :user_id
        t.date :date
        t.hstore :items
        t.boolean :complete

        t.timestamps null: false
      end
    end
  end
end
