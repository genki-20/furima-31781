class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item
  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.buy != nil
    @user_buy_form = UserBuyForm.new
  end

  def create
    @user_buy_form = UserBuyForm.new(street_address_params)
    if @user_buy_form.valid?
      pay_item
      @user_buy_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def street_address_params
    params.require(:user_buy_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: street_address_params[:token],
      currency: 'jpy'
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end
