class TransactionDetailsController < ApplicationController
  def new
  end

  def show
    @transaction=TransactionDetail.find(params[:id])

  end

  def index

  end
  def create
    order=Order.find(params[:order_id])    
    @transaction=TransactionDetail.new(user_id:current_user.id ,order_id: params[:order_id],order_amount:order.total_amount)
    if @transaction.valid?
      @transaction.payment_status=1
      @transaction.save
      flash[:notice] = "Transaction Sucessful!"
      redirect_to transaction_detail_path(@transaction.id)
    else
      flash[:notice] = "Transaction failed!"
      redirect_to show_order_details_path(order_id: order.id)
    end
  end

end
