class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!

   def new
      @order = Order.new
   end

   def confirm
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items
      @total = 0
      @postage = 800
   end

   def complete
   end

   def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new(item_id: cart_item.item_id, order_id: @order.id, amount: cart_item.amount, purchase_price: cart_item.item.price*1.1)
        @order_detail.save
      end
      @cart_items.destroy_all
      redirect_to orders_complete_path
   end
   
   def index
      @orders = current_customer.orders
      @postage = 800
   end

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
