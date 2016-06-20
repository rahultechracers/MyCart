class User < ActiveRecord::Base
  has_many :orders
  has_many :carts
  has_many :transactions
  validates :first_name, :last_name ,presence: true, format:{ with: /\A([a-zA-z]+)\z/}
  validates :email ,format: { with: /\A([^@\s]+)@([a-zA-z]{2,}).([a-z]{2,})\Z/ }
  validates :address, format: { with: /\A[a-zA-z0-9]+\z/ ,multiline: true  }
  validates :city, :state, presence: true ,format:{ with: /\A[a-zA-z]+\z/}
  validates :phone, presence:true ,numericality: {only_integer: true},length: {is:10}
  validates :password ,format: {with:/\A[a-zA-z0-9]+{6}\z/, message:"Password should be alphanumeric and atleast 6 characters long"}
end
