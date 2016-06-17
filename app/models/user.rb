class User < ActiveRecord::Base
  has_many :orders
  has_many :carts
  has_many :transactions
end
