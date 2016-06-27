class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_details

  def total_value
    cart_details.sum(:amount)
  end
end
