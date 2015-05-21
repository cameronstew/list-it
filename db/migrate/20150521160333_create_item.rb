class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.string :category
    end
  end
end
