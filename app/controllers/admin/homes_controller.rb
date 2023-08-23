class Admin::HomesController < ApplicationController
  
  def top
     @orders = Order.page(params[:page])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postal_code, :postage, :amounts_billed, :payment_method, :created_at )
  end
end
