# frozen_string_literal: true

# CRUD for Category
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
    authorize @categories
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      flash[:success] = 'New category created'
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category updated'
      redirect_to categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Category Destroyed'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def load_category
    @category = Category.find(params[:id])
    authorize @category
  end
end
