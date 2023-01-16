class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id


    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
			 cart_item.amount += params[:cart_item][:amount].to_i
			 cart_item.save
			 redirect_to cart_items_path
		elsif @cart_item.save
			    redirect_to cart_items_path

		else
		  render 'items/(item.id)'

    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    CartItem.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id, :image, :name, :price, :is_active, :genre_id)
  end
end
