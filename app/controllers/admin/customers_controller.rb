class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).reverse_order.per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end
  
  private
  
  def customer_params
    params.require(:customer)
          .permit(:customer_id, :last_name, :first_name, :kana_last_name, :kana_first_name,
            :postal_code, :address, :phone_number, :email, :is_active)
  end

end
