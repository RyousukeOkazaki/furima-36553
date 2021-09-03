require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1 # "MySQL client is not connectedのエラー対策"
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角文字列なら登録できること' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'telは最低10桁の半角数字なら登録できること' do
        @order_address.tel = 1_234_567_890
        expect(@order_address).to be_valid
      end
      it 'telは最高11桁の半角数字なら登録できること' do
        @order_address.tel = 12_345_678_901
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「-」を挟まないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeの「-」前が「3桁の半角数字」でないと保存できないこと' do
        @order_address.postal_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeの「-」後が「4桁の半角数字」でないと保存できないこと' do
        @order_address.postal_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが「全角数字」では保存できないこと' do
        @order_address.postal_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank", 'Tel is invalid')
      end
      it 'telにハイフンがあると保存できないこと' do
        @order_address.tel = '123-4567-8901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telに全角数字があると保存できないこと' do
        @order_address.tel = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが10桁未満だと保存できないこと' do
        @order_address.tel = 123_456_789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが11桁超過だと保存できないこと' do
        @order_address.tel = 123_456_789_012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userがいないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemがないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
