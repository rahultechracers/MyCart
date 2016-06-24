class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates  :quantity ,numericality: {only_integer: true} 
  validates  :price ,numericality: true 
  def getsum(items)
    sum=0
    @items.each do |item|
      product = Product.find_by(id: item.product_id)
      sum+= product.price*item.quantity
    end
    return sum.to_i
  end
end
