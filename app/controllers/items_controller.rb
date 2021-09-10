class ItemsController < ApplicationController

  def index
  end

  def new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:nickname, :email, :encrypted_password, :last_name, :first_name, :last_kana, :first_kana, :birthday)
  end
end
