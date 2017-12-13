class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @cart = Cart.find_by(id: params[:id])
    @cart.checkout
    # raise params.inspect

    current_user.remove_current_cart

    redirect_to cart_path(@cart)
  end

end
