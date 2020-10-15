require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe 'Order' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:buy, item_id: @item.id, user_id: @user.id)
      sleep(1)
    end


    describe '商品購入' do
      context '商品購入がうまくいくとき' do
        it "全ての項目の入力が存在すれば出品できる" do
          expect(@order).to be_valid
        end
      end

  
      context '商品購入がうまくいかないとき' do
        it "クレジットカード情報がないと購入できない" do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
  
        it "郵便番号が空白だと購入できない" do
          @order.postal_code = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code can't be blank")
        end

        it "郵便番号にハイフンがないと購入できない" do
          @order.postal_code = 1234567
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code Input correctly")
        end

        it "都道府県を選んでないと購入できない" do
          @order.prefecture_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Prefecture Select")
        end

        it "市区町村が空白だと購入できない" do
          @order.city = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end

        it "番地が空白だと購入できない" do
          @order.house_number = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("House number can't be blank")
        end

        it "電話番号が空白だと購入できない" do
          @order.phone_number = ''
          binding.pry
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end

        # it "電話番号にハイフンがあると購入できない" do
        #   binding.pry
        #   @order.phone_number = 123-4567-8910
        #   @order.valid?
        #   expect(@order.errors.full_messages).to include("Phone number Input only number")
        # end

        it "電話番号は11桁以内で入力しないと購入できない" do
          @order.phone_number = '123456789101'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number Input only number")
        end
      end
    end
end
end