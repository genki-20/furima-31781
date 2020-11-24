class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanatory_name, :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end