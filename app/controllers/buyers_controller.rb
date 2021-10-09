class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @buyers_shipping_add = BuyersShippingAdd.new
  end

  def create
    @buyers_shipping_add = BuyersShippingAdd.new(buyers_params)
    if @buyers_shipping_add.valid?
      pay_item
      @buyers_shipping_add.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyers_params
    params.require(:buyers_shipping_add).permit(:postal_number, :prefecture_id, :city, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyers_params[:token],
      currency: 'jpy'
    )
  end
    
  def move_to_index
    if user_signed_in?
      if current_user.id == @item.user_id 
        redirect_to root_path
      else
        if @item.buyer.present?
          redirect_to root_path
        end
      end
    else
      redirect_to user_session_path
    end
  end
end
