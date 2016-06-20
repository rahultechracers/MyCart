class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates  :quanity ,numericality: {only_integer: true} 
  validates  :price ,numericality: true 
end
