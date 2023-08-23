class Admin::OrdersController < ApplicationController

  def show
     @order = Order.find(params[:id])
     @order_details = @order.order_details
     @total = 0
     @postage = 800
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postal_code, :postage, :amounts_billed, :payment_method, :created_at )
  end

end
