class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total= 0
    @subtotal = 0
    @order.order_details.each do |order_detail|
      @total = @total + order_detail.amount*order_detail.with_tax_price
    end
  end
end
