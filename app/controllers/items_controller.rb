class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order(id: 'ASC')
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

  def show
  end

  def edit
    unless @item.buy.nil?
      redirect_to unless current_user.id == @item.user_idroot_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanatory_name, :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
