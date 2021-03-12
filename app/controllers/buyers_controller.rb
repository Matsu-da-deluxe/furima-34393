class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @buyer_address = BuyersAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_address = BuyersAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id)
  end
end
