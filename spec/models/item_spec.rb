require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '出品物の保存' do
    context '出品物が保存できる場合' do
      it '全てのカラムが存在すれば保存できる' do
        expect(@item).to be_valid
      end
      it '価格が300円から保存できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '価格が9999999円まで保存できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
      it '価格が半角数字であれば保存できる' do
        @item.price = 5000
        expect(@item).to be_valid
      end
    end
    
    context '出品物が保存できない場合' do
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと保存できない' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it '商品の説明がないと保存できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーの情報がないと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'カテゴリーのidが1であるときは保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it '商品の状態についての情報がないと保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it '商品の状態のidが1であるときは保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it '配送料の負担についての情報がないと保存できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Select")
      end
      it '配送料の負担のidが1であるときは保存できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Select")
      end
      it '発送元の地域についての情報がないと保存できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it '発送元の地域のidが1であるときは保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it '発送までの日数についての情報がないと保存できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")
      end
      it '発送までの日数のidが1であるときは保存できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")
      end
      it '価格についての情報がないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満の時保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格が9999999円より大きい時保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格が半角数字以外である時保存できない' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'Userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end

  end
end
