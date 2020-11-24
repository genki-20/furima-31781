require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる' do
      it 'Product name Explanatory name Price  Image Category Status Delivery fee  Area Daysが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'Product nameが空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'Explanatory nameが空では登録できない' do
        @item.explanatory_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanatory name can't be blank")
      end
      it 'Delivery feeが空では登録できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'Areaが空では登録できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'Daysが空では登録できない' do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'Priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'Imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'Categoryが空では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'Statusが空では登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'Priceが、半角数字での入力でなければ登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'Priceが299円以下であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'Priceが10000000円以上であれば登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
