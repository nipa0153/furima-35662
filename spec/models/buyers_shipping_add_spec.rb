require 'rails_helper'

RSpec.describe BuyersShippingAdd, type: :model do
  describe "商品購入機能" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyers_shipping_add = FactoryBot.build(:buyers_shipping_add, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it "全ての情報があれば購入できる" do
        expect(@buyers_shipping_add).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @buyers_shipping_add.building_name = ''
        expect(@buyers_shipping_add).to be_valid
      end

    end


    context "内容が登録できない場合" do
      it "postal_numberが空では登録できない" do
        @buyers_shipping_add.postal_number = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Postal number can't be blank")
      end

      it 'postal_numberのハイフンがなければ登録できない' do
        @buyers_shipping_add.postal_number = '1234567'
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include('Postal number is invalid. include hyphen(-)')
      end

      it 'prefecture_idが空では登録できない' do
        @buyers_shipping_add.prefecture_id = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Prefecture can't be blank")        
      end

      it 'prefecture_idの値が選択されていない(idが１)場合は出品できない' do
        @buyers_shipping_add.prefecture_id = '1'
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Prefecture is invalid. choose on and after 2")
      end

      it 'cityが空では登録できない' do
        @buyers_shipping_add.city = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("City can't be blank")        
      end

      it 'addressが空では登録できない' do
        @buyers_shipping_add.address = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Address can't be blank")        
      end

      it 'telが空では登録できない' do
        @buyers_shipping_add.tel = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Tel can't be blank")                
      end

      it 'telが9桁以上でなければ登録できない' do
        @buyers_shipping_add.tel = '09012345'
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Tel is invalid.")        
      end
      it 'telが12桁以上は登録できない' do 
        @buyers_shipping_add.tel = '090123456789'
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Tel is invalid.")
      end

      it 'telが英数混合では登録できない' do
        @buyers_shipping_add.tel = '0901234asdf'
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Tel is invalid.")
      end

      it 'tokenがなければ登録できない' do
        @buyers_shipping_add.token = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていなければ登録できない' do
        @buyers_shipping_add.user_id = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("User can't be blank")        
      end

      it 'itemが紐付いていなければ登録できない' do
        @buyers_shipping_add.item_id = ''
        @buyers_shipping_add.valid?
        expect(@buyers_shipping_add.errors.full_messages).to include("Item can't be blank")        
      end
    end
  end
end