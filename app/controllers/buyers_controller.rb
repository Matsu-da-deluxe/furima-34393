class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @buyer_address = BuyersAddress.new
    @item = Item.find(params[:item_id])

    unless @item.user_id != current_user.id || @item.buyer.nil?
      redirect_to root_path
    end
    
  end

  def create
    @buyer_address = BuyersAddress.new(buyer_params)
    @item = Item.find(params[:item_id])
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buyers_address).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
