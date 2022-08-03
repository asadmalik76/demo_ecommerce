class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:success] = 'New Brand created'
      redirect_to brands_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      flash[:success] = 'Brand updated'
      redirect_to brands_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    flash[:success] = 'Brand Destroyed'
    redirect_to brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

end
