class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :itemes
  has_many :buyers
  
    
    with_options presence: true do
      validates :nickname
      validates :email
      validates :birthday
      validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ ,message: " Include both letters and numbers"}
      validates :f_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters."}
      validates :l_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters."}
      validates :f_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
      validates :l_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  end

end
