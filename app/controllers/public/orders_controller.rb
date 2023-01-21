class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders

  end

  def new
    @order = Order.new
    @addresses = Address.all
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    @total = 0

    if params[:order][:select_address] == "0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
          @address = Address.find(params[:order][:address_id])
          @order.postal_code = @address.postal_code
          @order.address = @address.address
          @order.name = @address.name

    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
    @order.status = 0
    @order.save

    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.making_status = 0

      @order_detail.save
      current_customer.cart_items.destroy_all
    end
    redirect_to orders_complete_path
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.order_details.each do |order_detail|
      @total = @total + order_detail.amount*order_detail.price
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method,  :customer_id)
  end

end
