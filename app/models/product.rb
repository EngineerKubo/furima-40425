class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_shipping

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_shipping_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300~¥9,999,999の間のみ保存可能です' }
  validate :price_must_be_half_width_number

  private

  def price_must_be_half_width_number
    errors.add(:price, 'は半角数値のみ保存可能です') unless price.to_s =~ /\A[0-9]+\z/
  end

end