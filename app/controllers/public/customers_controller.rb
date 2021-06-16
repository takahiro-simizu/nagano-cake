class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
  end

  def update
  end

  def resign
  end

  def resign_prcs
  end

end
