class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, only: :edit

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

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return redirect_to user_session_path unless user_signed_in?
    return redirect_to root_path if @item.buyer.present?
    return redirect_to action: :index if current_user.id != @item.user_id
  end
end