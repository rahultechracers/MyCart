class CartDetailsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def destroy
  end
  def create
    cart=Cart.find(params[:cart_id])
    current_item = cart.cart_details.find_by(product_id:params['product_id'])
    if current_item
    current_item.quantity += 1
    else
        current_item=cart.cart_details.new(product_id:  params["product_id"], quantity: "1")
    end
    if current_item.save
      redirect_to products_path
    else

    end
  end
end
