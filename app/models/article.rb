class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :area
  belongs_to :date

  validates :title, :text, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :ship_fee_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :date_id, numericality: { other_than: 1 }

end
