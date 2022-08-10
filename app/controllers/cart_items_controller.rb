# frozen_string_literal:

# cart items controller

class CartItemsController < ApplicationController
  before_action :load_cart, only: %i[create]
  def index; end

  def new; end

  def create
    @product = Product.find(params[:id])
    @cart_item = CartItem.create(cart_id: @cart.id, product_id: @product.id, quantity: 1)
  end

  private

  def load_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      if user_signed_in?
        @cart = Cart.create(user_id: current_user.id)
        session[:cart_id] = @cart.id
      elsif @cart.create
        session[:cart_id] = @cart.id
      end
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:id)
  end
end
