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
    #@order = Order.new(order_params)
    #if @#order.invalid?
       #render :new
    #end
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
