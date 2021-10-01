class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]


  def index
    @items = Item.all.order(id: "DESC")
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

  def edit
    @item = Item.find(params[:id])
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :category_id, 
      :condition_id, :postage_id, 
      :prefecture_id, :delivery_day_id, 
      :items_name, :explanation, 
      :price, :user_id).merge(user_id: current_user.id)
  end
end
