require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, product_id: product.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_shipping_address.post_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:post_code]).to include("can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_address.post_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:post_code]).to include('is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが選択されていないと保存できないこと' do
        @order_shipping_address.prefecture_id = 0
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'municipalityが空だと保存できないこと' do
        @order_shipping_address.municipality = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:municipality]).to include("can't be blank")
      end

      it 'street_addressが空だと保存できないこと' do
        @order_shipping_address.street_address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:street_address]).to include("can't be blank")
      end

      it 'telephone_numberが空だと保存できないこと' do
        @order_shipping_address.telephone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:telephone_number]).to include("can't be blank")
      end

      # 'telephone_numberが9桁以下では登録できないこと
      it 'telephone_numberが9桁以下では登録できないこと' do
        @order_shipping_address.telephone_number = '123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:telephone_number]).to include('is invalid')
      end

      # 'telephone_numberが12桁以上では登録できないこと
      it 'telephone_numberが12桁以上では登録できないこと' do
        @order_shipping_address.telephone_number = '123456789012'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:telephone_number]).to include('is invalid')
      end

      # 'telephone_numberが半角数字以外が含まれている場合、登録できないこと
      it 'telephone_numberに半角数字以外が含まれている場合、登録できないこと' do
        @order_shipping_address.telephone_number = '123-456-7890'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:telephone_number]).to include('is invalid')
      end

      it 'user_idが空だと保存できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:user_id]).to include("can't be blank")
      end

      it 'product_idが空だと保存できないこと' do
        @order_shipping_address.product_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:product_id]).to include("can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end