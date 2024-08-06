class OrdersController < ApplicationController
  def index
    @order_shipping_addresses = OrderShippingAddress.new
  end

  def create
    @order_shipping_addresses = OrderShippingAddress.new(order_shipping_addresses_params)
    if @order_shipping_addresses.valid?
      @order_shipping_addresses.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_shipping_addresses_params
    params.require(:order_shipping_addresses).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end