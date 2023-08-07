require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_delivery = FactoryBot.build(:order_delivery, item_id: item.id, user_id: user.id)
    end

    context '保存できる場合' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '保存できない場合' do
      it 'post_codeが空では保存できない' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが含まれないと保存できない' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeに数字とハイフン以外が含まれると保存できない' do
        @order_delivery.post_code = 'aaa-1234'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeに全角文字が含まれると保存できない' do
        @order_delivery.post_code = '１２３-４５６７'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが空では保存できない' do
        @order_delivery.prefecture_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが未選択(0)では保存できない' do
        @order_delivery.prefecture_id = 0
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @order_delivery.municipalities = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに数字以外が含まれると保存できない' do
        @order_delivery.phone_number = '123-456-7890'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに全角数字が含まれると保存できない' do
        @order_delivery.phone_number = '１２３４５６７８９０'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下では保存できない' do
        @order_delivery.phone_number = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order_delivery.phone_number = '123456789012'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では保存できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
