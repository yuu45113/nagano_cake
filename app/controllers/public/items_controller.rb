class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, except: [:index, :show]
  
  def create
    
  end
  
  def index
    @items = Item.page(params[:page]).per 8
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_items=CartItem.new
  end
  
end