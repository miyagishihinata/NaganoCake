class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(list_params)
    itme.save
    redirect_to admin_item_path
  end

  def show
  end

  def edit
  end

  def update
  end
  
  def list_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
