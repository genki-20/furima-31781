require 'rails_helper'

RSpec.describe UserBuyForm, type: :model do
  before do
    @user_buy_form = FactoryBot.build(:user_buy_form)
  end

  describe '商品購入、配送先' do
    context '商品出品ができる' do
      it 'postal_code prefecture municipality  phone_number address,token,が存在すれば登録できる' do
        expect(@user_buy_form).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @user_buy_form.token = nil
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと登録できない' do
        @user_buy_form.postal_code = ''
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectureが空では登録できない' do
        @user_buy_form.prefecture_id = '0'
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @user_buy_form.phone_number = ''
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'addressが空では登録できない' do
        @user_buy_form.address = ''
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'Postal codeのハイフンがないと登録できない' do
        @user_buy_form.postal_code = '1223333'
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include('Postal code is invalid.')
      end
      it 'phone_numberが１２桁以上では登録できない' do
        @user_buy_form.phone_number = '1111111111111111111'
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberにハイフンがあると登録できない' do
        @user_buy_form.phone_number = '123-123-123'
        @user_buy_form.valid?
        expect(@user_buy_form.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end
