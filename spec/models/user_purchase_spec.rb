require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe 'ユーザー新規登録' do
    context '購入情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @user_purchase.building = nil
        expect(@user_purchase).to be_valid
      end
    end

    context '購入情報の保存ができないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_purchase.postal_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_purchase.postal_code = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefectureのidが0であるときは保存できないこと' do
        @user_purchase.prefecture_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture Select")
      end
      it 'minicipalityが空では保存できないこと' do
        @user_purchase.municipality = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'Addressが空では保存できないこと' do
        @user_purchase.address = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @user_purchase.phone_number = '099-3328-1211'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberの先頭が0でない場合は保存できないこと' do
        @user_purchase.phone_number = '11133281211'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが10桁未満である場合は保存できないこと' do
        @user_purchase.phone_number = '01133281'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが12桁より大きい場合は保存できないこと' do
        @user_purchase.phone_number = '011332834321'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが全角数字である場合は保存できないこと' do
        @user_purchase.phone_number = '０９７３１１１４５３４'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
