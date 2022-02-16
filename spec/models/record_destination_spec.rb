require 'rails_helper'

RSpec.describe RecordDestination, type: :model do
  describe '購入記録と配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_destination = FactoryBot.build(:record_destination, user_id: user.id, item_id: item.id)
    end

    context '購入にかかる情報の入力に問題がない場合' do
      it 'すべての値が正しく入力されていれば送信に成功する' do
        expect(@record_destination).to be_valid
      end
      it 'building_nameは空でも送信に成功する' do
        @record_destination.building_name = ''
        expect(@record_destination).to be_valid
      end
    end

    context '購入にかかる情報の入力に問題がある場合' do
      it 'post_codeが空だと送信に失敗する' do
        @record_destination.post_code = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefectureが未選択だと送信に失敗する' do
        @record_destination.prefecture_id = 1
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと送信に失敗する' do
        @record_destination.city = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと送信に失敗する' do
        @record_destination.address = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと送信に失敗する' do
        @record_destination.phone_number = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと送信に失敗する' do
        @record_destination.post_code = '1234567'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeが全角数字だと送信に失敗する' do
        @record_destination.post_code = '１２３-４５６７'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'phone_numberが全角数字だと送信に失敗する' do
        @record_destination.phone_number = '０９０１２３４５６７８'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberにハイフンが含まれていると送信に失敗する' do
        @record_destination.phone_number = '090-1234-5678'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが9桁以下だと送信に失敗する' do
        @record_destination.phone_number = '090123456'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが12桁以上だと送信に失敗する' do
        @record_destination.phone_number = '090123456789'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと送信に失敗する' do
        @record_destination.user_id = nil
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと送信に失敗する' do
        @record_destination.item_id = nil
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが存在していないと送信に失敗する' do
        @record_destination.token = nil
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
