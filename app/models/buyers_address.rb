class BuyersAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building_name, :phone_num, :buyer, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: {with: /\A\d{11}\z/, message: "is invalid. without hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数buyerに代入する
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # buyer_idには、変数buyerのidと指定する
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_num: phone_num, buyer_id: buyer.id)
  end

end