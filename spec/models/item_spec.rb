require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品アイテムの保存' do
    context '保存できる場合' do
      it '全ての項目で正しい値が存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '画像が存在しないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では保存できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが0("---")では保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_status_idが空では保存できない' do
        @item.item_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'item_status_idが0("---")では保存できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'fee_status_idが空では保存できない' do
        @item.fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee status can't be blank")
      end
      it 'fee_status_idが0("---")では保存できない' do
        @item.fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee status can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0("---")では保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_schedule_idが空では保存できない' do
        @item.delivery_schedule_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery schedule can't be blank")
      end
      it 'delivery_schedule_idが0("---")では保存できない' do
        @item.delivery_schedule_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery schedule can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceに数字以外が含まれると保存できない' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが299以下では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end
      it 'priceが10,000,000以上では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end
    end
  end
end
