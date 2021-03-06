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
<<<<<<< HEAD
        expect(@item.errors.full_messages).to include("商品名を入力してください")
=======
        expect(@item.errors.full_messages).to include('商品名を入力してください')
>>>>>>> 1f2f392482853f6c26417e0c653423e3b7ffcbae
      end
      it 'Explanatory nameが空では登録できない' do
        @item.explanatory_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'Delivery feeが空では登録できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料を入力してください")
      end
      it 'Areaが空では登録できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'Daysが空では登録できない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'Priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'Imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'Categoryが空では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'Statusが空では登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'Priceが、半角数字での入力でなければ登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が正しくありません')
      end
      it 'Priceが299円以下であれば登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が正しくありません')
      end
      it 'Priceが10000000円以上であれば登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格が正しくありません')
      end
    end
  end
end
