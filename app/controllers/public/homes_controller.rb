class Public::HomesController < ApplicationController
  def top
    @items = Item.limit(4)
  end

  def about
  end

  def item_params
    params.require(:home).permit(:name, :price, :is_active, :genre_id, :image)
  end

end
