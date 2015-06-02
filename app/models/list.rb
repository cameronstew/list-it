class List < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items, :allow_destroy => true

  # store_accessor :items, :item
  # store_accessor :items, :quantity

  # def list_date
  #   date.strftime('%B %d %Y')
  # end
end
