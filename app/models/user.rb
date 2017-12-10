class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  # belongs_to :current_cart, class_name: "Cart", foreign_key: "cart_id"

  def current_cart=(cart)
    carts << cart
  end

  def current_cart
    @current_cart ||= carts.last
  end
end
