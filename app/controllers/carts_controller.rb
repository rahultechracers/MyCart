class CartsController < ApplicationController

  after_action :getsum , :only=> [:create,:destroy]

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
end
