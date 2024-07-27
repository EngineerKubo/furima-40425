FactoryBot.define do
  factory :product do
    association :user
    product_name          { 'サンプル商品' }
    description           { 'これはサンプル商品の説明です。' }
    category_id           { 1 }
    condition_id          { 1 }
    shipping_charge_id    { 1 }
    prefecture_id         { 1 }
    days_to_shipping_id   { 1 }
    price                 { 1000 }
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end