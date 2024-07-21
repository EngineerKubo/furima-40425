class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
    t.references :user, foreign_key: true
    t.string :product_name
    t.text :description
    t.integer :category_id
    t.integer :condition_id
    t.integer :shipping_charge_id
    t.integer :prefecture_id
    t.integer :days_to_shipping_id
    t.integer :price
    t.timestamps
    end
  end
end