RSpec.describe User, type: :model do
describe 'User' do
  before do
    @user = FactoryBot.build(:user)
  end
      
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目の入力が存在すれば登録できる" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "passwardが６文字以上で登録できる" do
        @user.passward = "aaaa1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passward is too long (maximum is 6 characters)")
      end


    end

    context '新規登録がうまくいかないとき' do
      it "nick_nameが空だと登録できない" do
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick_name can't be blank")
      end

      it "passwardが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordは確認用を含めて2回入力しないと登録できない" do
        @user.encrypted_password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordは半角英字のみでは登録できない" do
        @user.encrypted_password = aaaaaaaa
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordは半角数字のみでは登録できない" 
        @user.encrypted_password = 11111111
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
        @user.email = tesutogmail.com
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name can't be blank")
      end
  
      it "nameが空だと登録できない" do
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "family_nameが全角入力でないと登録できない" do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name can't be blank")
      end

      it "nameが全角入力でないと登録できない" do
        @user.nick_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
  
      it "family_nameのフリガナが空だと登録できない" do
        @user.family_name_show = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name_show can't be blank")
      end

      it "nameのフリガナが空だと登録できない" do
        @user.name_show = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name_show can't be blank")
      end

      it "family_nameのフリガナがカタカナ入力でないと登録できない" do
        @user.family_name_show = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name_show can't be blank")
      end

      it "nameのフリガナがカタカナ入力でないと登録できない" do
        @user.name_show = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name_show can't be blank")
      end

      it "birthdayが空白だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end  
end
