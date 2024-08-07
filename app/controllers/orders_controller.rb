class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipping_address = OrderShippingAddress.new
    @product = Product.find(params[:product_id])
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    @product = Product.find(params[:product_id])
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,                       # 商品の値段
      card: order_shipping_address_params[:token],  # カードトークン
      currency: 'jpy'                               # 通貨の種類（日本円）
    )
  end

end