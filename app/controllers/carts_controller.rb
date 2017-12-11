class CartsController < ApplicationController

  def show
    @cart = current_user.current_cart
  end

end
