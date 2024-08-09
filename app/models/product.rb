class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_shipping

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 0}
  validates :condition_id, numericality: { other_than: 0}
  validates :shipping_charge_id, numericality: { other_than: 0}
  validates :prefecture_id, numericality: { other_than: 0}
  validates :days_to_shipping_id, numericality: { other_than: 0}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300~¥9,999,999の間のみ保存可能です' }

  private

end