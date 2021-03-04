class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :area
  belongs_to :date
  has_one_attached :image
  has_one :buyer

  validates :title, :text, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  


  with_options presence: true do
    validates :price,numericality:{only_integer:true, message:'Half-width number'}
    validates :price,numericality:{greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999,message:'Out of setting range'}
  end


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :ship_fee_id
    validates :area_id
    validates :date_id
  end
end
