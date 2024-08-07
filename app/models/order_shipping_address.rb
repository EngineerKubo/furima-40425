class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :product_id, :post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number, :user_id, :order_id, :token


  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(
      order_id: order.id,
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipality: municipality,
      street_address: street_address,
      building_name: building_name,
      telephone_number: telephone_number
    )
  end
end
