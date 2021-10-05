class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]

  def index
    # @buyers = Buyer.new
    @buyers_shipping_add = BuyersShippingAdd.new
    # @item.buyers.includes(:user_id, :item_id)
  end

  def create
    @buyers_shipping_add = BuyersShippingAdd.new(buyers_params)
    if @buyers_shipping_add.valid?
      @buyers_shipping_add.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyers_params
    params.require(:buyers_shipping_add).permit(:postal_number, :prefecture_id, :city, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
