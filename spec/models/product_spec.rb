require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user: @user)
  end

  describe '商品出品' do
    context '新規出品できるとき' do
      it 'imageとproduct_nameとdescriptionとcategory_idとcondition_idとshipping_charge_idとprefecture_idとdays_to_shipping_idとpriceが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '新規出品できないとき' do
      # 商品画像
      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      # 商品名
      it 'product_nameが空では登録できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      # 商品の説明
      it 'descriptionが空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      # 商品のカテゴリー
      it 'category_idが空では登録できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      # 商品の状態
      it 'condition_idが空では登録できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      # 配送料の負担
      it 'shipping_charge_idが空では登録できない' do
        @product.shipping_charge_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
      end
      # 発送元の地域
      it 'prefecture_idが空では登録できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      # 発送までの日数
      it 'days_to_shipping_idが空では登録できない' do
        @product.days_to_shipping_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to shipping can't be blank")
      end
      # 販売価格
      it 'priceが空では登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300未満だと保存できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は¥300~¥9,999,999の間のみ保存可能です")
      end
      it '価格が¥10,000,000以上だと保存できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は¥300~¥9,999,999の間のみ保存可能です")
      end
      it '価格が半角数値でないと保存できない' do
        @product.price = '３０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は¥300~¥9,999,999の間のみ保存可能です")
      end
      it '価格が整数でないと保存できない' do
        @product.price = 300.5
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は¥300~¥9,999,999の間のみ保存可能です")
      end
    end
  end
end