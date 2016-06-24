class OrderDetailsController < ApplicationController
  def index
    @items=OrderDetail.all
  end

  def new
  end

  def create


  end

  def show
    o=Order.find(params[:order_id])
    @od = o.order_details
  end

  def destroy
  end
end
