# frozen_string_literal: true

# CartsController
class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
    @cart_items = @cart.cart_items
  end

  def new; end

  def create
    @cart = Cart.new
    if user_signed_in?
      @cart = Cart.new(user_id: current_user.id)
      session[:cart_id] = @cart.id
    elsif @cart.create
      session[:cart_id] = @cart.id
    end
  end
end
