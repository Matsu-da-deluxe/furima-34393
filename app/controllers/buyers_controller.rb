class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :check_user, only: [:index, :create]

  def index
    @buyer_address = BuyersAddress.new
  end

  def create
    @buyer_address = BuyersAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:buyers_address).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def check_user
    redirect_to root_path if current_user == @item.user || @item.buyer.present?
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
