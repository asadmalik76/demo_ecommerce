# frozen_string_literal: true

# Stripe Controller

class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new; end

  def create
    @charge=StripeChargesServices.new(charges_params, current_user).call
    if @charge.paid || @charge.status == 'succeeded'
      @order = Order.find_by(order_id: session[:order_id])
      @order.status = 'processing'
      @order.save
      render 'orders/success'
    else
      redirect_to orders_path
    end
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end

