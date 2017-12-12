class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @cart = current_user.current_cart
    # raise current_user.current_cart.line_items.inspect
    @cart.line_items.each do |line|
      item = Item.find_by(id: line.item_id)
      item.inventory -= line.quantity
      item.save
    end
    @cart.status = "submitted"
    current_user.current_cart = nil
    current_user.save
    @cart.save
    redirect_to cart_path(@cart)
  end

end
