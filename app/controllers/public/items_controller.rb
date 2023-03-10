class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    session[:previous_url] = request.referer

  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image, :amount)
  end

end
