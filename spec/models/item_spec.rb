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
      it 'nameが空では登録できない' do
        @item.name = ''
        @user.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
      end
      it 'categoryが空では登録できない' do
      end
      it 'statusが空では登録できない' do
      end
      it 'costが空では登録できない' do
      end
      it 'prefectureが空では登録できない' do
      end
      it 'daysが空では登録できない' do
      end
      it 'priceが空では登録できない' do
      end
      it 'userが紐づいていないと登録できない' do
      end
      it 'nameが41文字以上だと登録できない' do
      end
      it 'descriptionが1000文字以上だと登録できない' do
      end
      it 'priceが299円以下だと登録できない' do
      end
      it 'priceが10,000,000円以上だと登録できない' do
      end

    end
  end
end
