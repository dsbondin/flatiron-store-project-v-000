class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.current_cart = current_user.carts.create unless !!current_user.current_cart
    current_user.current_cart.add_item(params[:item_id]).save
    current_user.save
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end

end
