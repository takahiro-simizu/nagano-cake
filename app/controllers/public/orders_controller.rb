class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @cart_items = CartItem.all
    @order = Order.new(payments: params[:order][:payments].to_i, postage: 800)
    if params[:order][:address_option] == "1"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
    else
       @order.postal_code = params[:order][:postal_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
    end
    #binding.pry
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cart_item|
      @order_items = OrderItem.create(
        customer_id: @order.customer.id,
        item_id: cart_item.item.id,
        order_id: @order.id,
        price: cart_item.item.price,
        amount: cart_item.amount
        )
      end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def index
    @order = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :payments, :postage, :total_price, :name)
  end


end
