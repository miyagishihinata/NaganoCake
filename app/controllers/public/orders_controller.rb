class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @addresses = Address.all
    @customer = current_customer
  end

  def comfirm
    @order = Order.new(order_params)
    
    if params[:order][:select_address] == "0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
       binding.pry
       
    elsif params[:order][:select_address] == "1"
          @order.postal_code = .postal_code
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :postal_code, :last_name, :first_name, :customer_id)
  end

end
