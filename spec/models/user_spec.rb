require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
      
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目の入力が存在すれば登録できる" do
        # user = build(:user)
        expect(@user).to be_valid
      end

      # it "ppasswordが６文字以上で登録できる" do
      #   @user.password = "aaaa1111"
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Password is too long (maximum is 6 characters)")
      # end
    end
    

    context '新規登録がうまくいかないとき' do
      it "nick_nameが空だと登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it "passwardが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      # it "passwordは半角英字のみでは登録できない" do
      #   @user.password = 'aaaaaaaa'
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      # end

      it "passwordは半角数字のみでは登録できない" do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに＠が付いてないと登録できない" do
        @user.email = "tesutogmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
  
      it "nameが空だと登録できない" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "family_nameが全角入力でないと登録できない" do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end

      it "nameが全角入力でないと登録できない" do
        @user.name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name Full-width characters")
      end
  
      it "family_nameのフリガナが空だと登録できない" do
        @user.family_name_show = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name show can't be blank")
      end

      it "nameのフリガナが空だと登録できない" do
        @user.name_show = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name show can't be blank")
      end

      it "family_nameのフリガナがカタカナ入力でないと登録できない" do
        @user.family_name_show = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name show Full-width katakana characters")
      end

      it "nameのフリガナがカタカナ入力でないと登録できない" do
        @user.name_show = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name show Full-width katakana characters")
      end

      it "birthdayが空白だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end  
end
