class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :nickname, :email,
      :encrypted_password, :last_name,
      :first_name, :last_kana, 
      :first_kana, :birthday, 
      :image, :category_id, 
      :condition_id, :postage_id, 
      :prefecture_id, :days_id, 
      :items_name, :explanation, 
      :price, :user_id).merge(user_id: current_user.id)
  end
end
