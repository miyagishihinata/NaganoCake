class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    itme.save
    redirect_to admin_item_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  def list_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
