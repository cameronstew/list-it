class Item < ActiveRecord::Base
  belongs_to :list

  enum category: [:produce, :meat, :fish, :poultry, :dairy, :pantry]
end
