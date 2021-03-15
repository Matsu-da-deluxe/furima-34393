class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @buyer_address = BuyersAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_address = BuyersAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_num, :price).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: buyer_params[:price],  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
