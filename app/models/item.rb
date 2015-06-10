class Item < ActiveRecord::Base
  belongs_to :list

  enum category: [:produce, :meat, :fish, :poultry, :dairy, :pantry]
  enum status: [:not_purchased, :purchased, :skipped]

  validates :description, presence: true
end
