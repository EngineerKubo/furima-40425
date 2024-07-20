class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      add_column :products, :user, :references, null: false
      add_column :products, :product_name, :string, null: false
      add_column :products, :description, :text, null: false
      add_column :products, :category_id, :integer, null: false
      add_column :products, :condition_id, :integer, null: false
      add_column :products, :shipping_charge_id, :integer, null: false
      add_column :products, :prefecture_id, :integer, null: false
      add_column :products, :days_to_shipping_id, :integer, null: false
      add_column :products, :price, :integer, null: false
      t.timestamps
    end
  end
end