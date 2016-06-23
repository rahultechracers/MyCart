class CartsController < ApplicationController
  def index
    @cart=carts.all
  end

  def create

  end

  def destroy
    
  end

  def show
    @items=current_user.carts.first.cart_details
    @a = getsum(@items)
  end

  def getsum(items)
      sum=0
      @items.each do |item|
      product = Product.find_by(id: item.product_id)

      sum+= product.price*item.quantity
      end
      return sum.to_i
  end
end
