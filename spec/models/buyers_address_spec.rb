require 'rails_helper'

RSpec.describe BuyersAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @user_1 = FactoryBot.create(:user)
      @user_2 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user_1.id)
      @buyers_address = FactoryBot.build(:buyers_address, user_id: @user_2.id, item_id: @item.id)
      sleep(1)
    end 

    describe '商品を購入する' do
      context '商品を購入できるとき' do
        it 'tokenとpostal_codeとarea_idとcityとaddressとphone_numとbuiding_nameが正しければ購入できる' do
        expect(@buyers_address).to be_valid
      end

      it 'building_nameが無くても購入できる' do
        @buyers_address.building_name = nil
        expect(@buyers_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空では購入できない' do
        @buyers_address.token = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @buyers_address.postal_code = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'area_idが空では購入できない' do
        @buyers_address.area_id = 1
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'cityが空では出品できない' do
        @buyers_address.city = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できない' do
        @buyers_address.address = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空では購入できない' do
        @buyers_address.phone_num = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @buyers_address.postal_code = '1234567'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeが前半3桁の入力でないと購入できないこと' do
        @buyers_address.postal_code = '1234-567'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeが後半4桁の入力でないと購入できないこと' do
        @buyers_address.postal_code = '12-34567'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'phone_numが12桁以上では購入できない' do
        @buyers_address.phone_num = '090123456789'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone num is invalid. without hyphen(-)")
      end
      it 'phone_numが8桁未満では購入できない' do
        @buyers_address.phone_num = '09012345'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone num is invalid. without hyphen(-)")
      end

      it 'phone_numが電話番号が数字のみでないとでは購入できない' do
        @buyers_address.phone_num = 'abc12345678'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone num is invalid. without hyphen(-)")
      end

      it 'phone_numが全角数字では購入できない' do
        @buyers_address.phone_num = '０９０１２３４５６７８'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone num is invalid. without hyphen(-)")
      end

      it 'user_idが空では購入できない' do
        @buyers_address.user_id = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @buyers_address.item_id = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
end
