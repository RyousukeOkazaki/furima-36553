require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、kana_last_name, kana_first_nameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '6文字以上のpasswordは登録できる' do
        @user.password = 'test123'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
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
      it 'emailは重複して登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'xxxx.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = 'test5'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合出ないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英語と半角数字を使用してください')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'test000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameとfirst_nameは空では登録できない' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end
      it 'last_nameとfirst_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'John'
        @user.first_name = 'Lennon'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）を使用してください',
                                                      'First name 全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'kana_last_nameとkana_first_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank", "Kana first name can't be blank")
      end
      it 'kana_last_nameとkana_first_nameは全角（カタカナ）でないと登録できない' do
        @user.kana_last_name = 'Yamada'
        @user.kana_first_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name 全角カナを使用してください', 'Kana first name 全角カナを使用してください')
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
