require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end
        
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "全ての項目の入力が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end




    context '商品出品がうまくいかないとき' do
      it "画像は1枚必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空白だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空白だと出品できない" do
        @item.comment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it "カテゴリーを選んでないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "商品の状態を選んでないと出品できない" do
        @item.show_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Show Select")
      end

      it "送料の負担について選んでないと出品できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery Select")
      end

      it "発送元の地域を選んでないと出品できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end

      it "発送までの日数を選んでないと出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")
      end

      it "販売価格が空白だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格が半角数字で入力しないと出品できない" do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it "販売価格が¥300以下だと出品できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "販売価格が¥9,999,999以上と出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end  
  end
end
end