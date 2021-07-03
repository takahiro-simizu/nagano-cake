class Public::ItemsController < ApplicationController

  def index
    @item = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart = CartItem.new
  end

end
