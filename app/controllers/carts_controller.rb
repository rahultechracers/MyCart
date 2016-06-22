class CartsController < ApplicationController
  def index
    @cart=carts.all
  end

  def create

  end

  def destroy
  end
  
  def show
    @items=cart.cart_details
  end
end
