class CartDetailsController < ApplicationController
  def index
  end

  def new
  end


  def show
  end
  def edit
    @cart_detail=CartDetail.find_by_id(params[:id])
    @product=Product.find_by(id:@cart_detail.product_id)
    
  end
  def update
    @cart_detail=CartDetail.find_by_id(params[:id])
    @cart_detail.update(quantity: params[:cart_detail][:quantity])
    #getsum()
    redirect_to cart_path
  end

  def destroy
    @item=CartDetail.find_by_id(params[:id])
    if @item.destroy
      redirect_to cart_path
    end
  end
  
  def create
    if current_user
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
    else
      redirect_to log_in
    end
  end
end
