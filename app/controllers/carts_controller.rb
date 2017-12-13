class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @cart = Cart.find_by(id: params[:id])
    @cart.checkout
    current_user.remove_current_cart

    redirect_to cart_path(@cart)
  end

end
