class ItemsController < ApplicationController
  def index 
  end

  def create
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

end
