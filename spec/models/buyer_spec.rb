require 'rails_helper'

RSpec.describe Buyer, type: :model do
  it "priceとtokenがあれば保存ができること" do
    expect(@buyer).to be_valid
  end

  it "priceが空では登録できないこと" do
    @buyer.price = nil
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @buyer.token = nil
    @buyer.valid?
    expect(@buyer.errors.full_messages).to include("Token can't be blank")
  end
  
end
