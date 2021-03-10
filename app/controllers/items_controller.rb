class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :item_user_check, only: [:edit, :update, :destroy]


  def index
    @items = Item.order("created_at DESC")
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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end    
  end

  def show
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text, :description, :price, :category_id, :status_id, :ship_fee_id, :area_id, :day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_user_check
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

end