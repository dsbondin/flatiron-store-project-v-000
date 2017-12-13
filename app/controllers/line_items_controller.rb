class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = (current_user.current_cart ||= current_user.carts.create)
    cart.add_item(params[:item_id]).save
    current_user.save
    cart.save
    redirect_to cart_path(cart)
  end

end
