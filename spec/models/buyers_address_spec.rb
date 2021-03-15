require 'rails_helper'

RSpec.describe BuyersAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyers_address, user_id: user.id,item_id: item.id)
      sleep(0.5)
    end  

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_address).to be_valid
    end

    it 'building_nameが空でも登録できる' do
      @buyer_address.building = ""
      expect(@buyer_address).to be_valid
    end
    
    it 'tokenが空だと保存できないこと' do
      @buyer_address.token = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
    end
    
    it 'postal_codeが空だと保存できないこと' do
      @buyer_address.zip_code = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
    end
    
    it 'area_idが0だと保存できないこと' do
      @buyer_address.prefecture_id = 0
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Area can't be blank")
    end
    
    it 'cityが空だと保存できないこと' do
      @buyer_address.city = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("City can't be blank")
    end
    
    it 'addressが空だと保存できないこと' do
      @buyer_address.street_number = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Address number can't be blank")
    end
    
    it 'phone_numが空だと保存できないこと' do
      @buyer_address.phone_number = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone num can't be blank")
    end
    
    it 'addressがハイフンを含んでいないと保存できないこと' do
      @buyer_address.zip_code = '1234567'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Address is invalid. Include hyphen(-)')
    end
    
    it 'phone_numは10桁以内の数値では保存できないこと' do
      @buyer_address.phone_number = '0900989887'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone num is invalid. without hyphen(-)")
    end
    
    it 'phone_numは12桁以上の数値では保存できないこと' do
      @buyer_address.phone_number = '090098988783'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone num is invalid. without hyphen(-)")
    end
    
    it 'phone_numはハイフンを含んでいれば保存できないこと' do
      @buyer_address.phone_number = '090-3456-3456'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone num is invalid. without hyphen(-)") 
    end
  end
end