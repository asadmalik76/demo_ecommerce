# frozen_string_literal: true

# OrdersController
class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_cart, only: %i[create]
  # before_action :set_order, only: %i[create]
  # before_action :load_order, only: %i[show]

  def index; end

  def show
    @order = if params[:order_id].present?
               Order.find_by(order_id: order_params)
             else
               Order.find_by(order_id: session[:order_id])
             end
  end

  def create
    @order = Order.new
    @order.user_id = current_user.id
    @order.save
    @total_amount = 0
    @cart.cart_items.each do |item|
      @order_items = OrderItem.new
      @order_items.assign_attributes({ order_id: @order.id, product_id: item.product_id,
                                       quantity: item.quantity, status: 'draft' })
      @total_amount = item.product.price * item.quantity + @total_amount
      @order_items.save
    end
    @order.amount = @total_amount
    @order.status = 'draft'
    @order.save
    session['order_id'] = @order.order_id
    redirect_to order_path(@order.order_id)
  end

  def myorders
    @orders = current_user.orders.all
    render 'orders/myorders'
  end

  def apply_coupon
    @coupon = Coupon.find_by(code: coupon_params[:code])
    @order = Order.find_by(order_id: coupon_params[:order_id])
    @discount = @order.amount * @coupon.discount
    @order.amount = @order.amount - @discount
    @order.discount = @discount
    @order.save
    redirect_to order_path(@order, order_id: @order.order_id)
  end

  private

  def load_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      redirect_to root_path
    end
  end

  def set_order; end

  def load_order
    if session[:order_id]
      @order = Order.find_by(order_id: session[:order_id])
    else
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order).permit(:order_id)
  end

  def coupon_params
    params.permit(:code, :order_id)
  end

end
