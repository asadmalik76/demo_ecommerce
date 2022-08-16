# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @product = Product.find(params[:id])
    @comments = @product.comments
  end

  def new; end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to product_path(@product.slug) }
        format.js {}
      end
    else
      flash[:alert] = 'Comment failed to save...'
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :product_id)
  end
end
