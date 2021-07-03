class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
       flash[:success] = "!----商品を削除しました----!"
       redirect_to cart_items_path
    else
       flash[:danger] = "!----商品の削除ができませんでした----!"
       render :index
    end
  end

  def destroy_all
    customer = Customer.find(current_customer.id)
    if customer.cart_item.destroy_all
       flash[:success] = "!----カート内の商品を全て削除しました----!"
       redirect_to cart_items_path
    else
       flash[:danger] = "!----商品を削除できませんでした----!"
       render :index
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
