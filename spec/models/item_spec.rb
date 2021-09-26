require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
    end

    context '商品出品ができる場合' do
      it '全ての情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'items_nameが空では出品できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it 'explanationがなければ出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idの値が選択されていない(idが１)場合は出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'Condition_idの値が選択されていない(idが１)場合は出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'postage_idの値が選択されていない(idが１)場合は出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'prefecture_idの値が選択されていない(idが１)場合は出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'days_idの値が選択されていない(idが１)場合は出品できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it 'imageがなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it 'priceが全角文字では出品できない' do
        @item.price = '２２111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'priceが300円未満では出品できない'do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'priceが9999999円未満では出品できない'do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end      
    end
  end
end
