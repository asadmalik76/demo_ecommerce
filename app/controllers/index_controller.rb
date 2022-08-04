# frozen_string_literal: true

# Website Pages
class IndexController < ApplicationController
  def index
    @products = Product.all
  end

  def unauthorized
    render 'errors/unauthorized'
  end
end
