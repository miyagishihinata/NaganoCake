class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total= 0
    @subtotal = 0
    @order.order_details.each do |order_detail|
      @total = @total + order_detail.amount*order_detail.with_tax_price
    end
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
    @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    ## ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
   params.require(:order).permit(:status)
  end
end
