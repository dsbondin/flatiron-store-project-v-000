class LineItemsController < ApplicationController
  before_action :authenticate_user!

  # def create
  #   # raise params.inspect
  #   current_user.current_cart.add_item(params[:item_id])
  #   current_user.current_cart.line_items.save
  #   redirect_to cart_path(current_user.current_cart)
  # end

end
