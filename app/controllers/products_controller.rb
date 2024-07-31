class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
    redirect_to product_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def correct_user
    unless current_user == @product.user
      redirect_to products_path, alert: '他のユーザーの投稿を編集することはできません。'
    end
  end

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_shipping_id, :price, :image).merge(user_id: current_user.id)
  end
end