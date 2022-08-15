# frozen_string_literal: true

class CommentsController < ApplicationController

  def index
    byebug
    @product = Product.find(params[:id])
    @comments = @product.comments
  end

  def new; end

  def create
    @comment = @comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: 'Comment created.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
