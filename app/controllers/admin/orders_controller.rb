class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total= 0
    @order.order_details.each do |order_detail|
      @total = @total + order_detail.amount*order_detail.price
    end
  end
end
