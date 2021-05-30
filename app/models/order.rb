class Order < ApplicationRecord
  
  belongs_to :customer
  
  has_many :order_
  
end
