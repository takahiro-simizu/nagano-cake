class Admin::HomesController < ApplicationController

  def top
    @order = Order.page(params[:page]).reverse_order
  end

end
