class OrdersController < ApplicationController
  def index
    @orders=Order.all
  end
  def new
    @order=Order.new 
  end

  def create
    @items=current_user.carts.first.cart_details
    @a=getsum(@items)
    @order=current_user.orders.new(order_params)
    if @order.save
      redirect_to 'orders'
    else
      render 'new'
    end
  end

  def edit
    @order=Order.find(params[:id])
  end

  def update
    @order=Order.find(params[:id])
     if @order.save
      redirect_to orders_path
    else
      render 'edit'
    end
  end


  def destroy
    @order=Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  def show
    @order=Order.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:shipping_address).merge(total_amount: @a.to_i, date:Time.now.strftime("%m/%d/%Y"))
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
