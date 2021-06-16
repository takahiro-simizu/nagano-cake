class Admin::OrdersController < ApplicationController

  def show
    @order = Orders.find
    @order_items = @order.order_items
  end

end
