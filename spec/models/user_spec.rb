require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationoとf_nameとl_nameとf_name_kanaとl_name_kanaとbirthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'f_nameが空では登録できない' do
        @user.f_name = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("F name can't be blank")
      end

      it 'l_nameが空では登録できない' do
        @user.l_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("L name can't be blank")
      end

      it 'f_name_kanaが空では登録できない' do
        @user.f_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana can't be blank")
      end

      it 'l_name_kanaが空では登録できない' do
        @user.l_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'f_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.f_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("F name is invalid. Input full-width characters.")
      end

      it 'l_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.l_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("L name is invalid. Input full-width characters.")
      end

      it 'f_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.f_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana is invalid. Input full-width katakana characters.")
      end

      it 'l_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.l_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana is invalid. Input full-width katakana characters.")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'a00000'
        @user.password_confirmation = 'b00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailに＠が含まれていないと登録できない' do
        @user.email = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  Include both letters and numbers')
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  Include both letters and numbers')
      end

      it 'passwordが全角では登録できない' do
        @user.password = 'あいうえおか'
        @user.password_confirmation = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  Include both letters and numbers')
      end
    end
  end
end 