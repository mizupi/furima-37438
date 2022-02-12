require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '商品の出品登録ができる場合' do
      it '必須項目に適切な値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品登録ができない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'statusが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'costが空では登録できない' do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'daysが空では登録できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'nameが41文字以上だと登録できない' do
        @item.name = Faker::String.random(length: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'descriptionが1000文字以上だと登録できない' do
        @item.description = Faker::String.random(length: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'priceが299円以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが10,000,000円以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
