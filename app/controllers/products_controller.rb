# frozen_string_literal: true

# Products CRUD
class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_product, only: %i[edit update destroy]

  def index
    @products = current_user.products.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      flash[:success] = 'New Product created'
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = 'Product updated'
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    flash[:success] = 'Product Destroyed'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :status, :category_id, :brand_id)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
