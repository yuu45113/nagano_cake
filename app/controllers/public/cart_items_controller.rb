class Public::CartItemsController < ApplicationController
   before_action :authenticate_customer!

   def create
     if current_customer.cart_items.all.find_by(item_id: params[:cart_item][:item_id])
        @cart_item = current_customer.cart_items.all.find_by(item_id: params[:cart_item][:item_id])
        @cart_item.amount = @cart_item.amount+(params[:cart_item][:amount]).to_i
        @cart_item.update(amount:@cart_item.amount)
     else
      @cart_items = CartItem.new(cart_item_params)
      @cart_items.customer_id = current_customer.id
      @cart_items.save
     end
     redirect_to cart_items_path
   end

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = CartItem.all
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, )
  end

end
