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
    @cart_item=CartDetail.new(product_id:  params["product_id"], quantity: "1")
    if @cart_item.save
      redirect_to products_path
    else

    end
  end
end
