class ProductsController < ApplicationController
  def index
    # @products = Product.order("created_at DESC")
  end

  def new
  end

  def create
    # @products = Product.new(products_params)
    # if @prototype.save
    #   redirect_to root_path
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end
end
