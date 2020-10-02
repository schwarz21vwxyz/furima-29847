RSpec.describe User, type: :model do
  describe User do
    describe '#create' do
      
    it "全ての項目の入力が存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空では登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwardが空だと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwardが６文字以上でないと登録できない" do
      user = build(:user, password: "123456", encrypted_password: "123456")
        expect(user).to be_valid
    end

    it "family_nameが空だと登録できない" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "nameが空だと登録できない" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "family_nameが全角日本語でないと保存できない" do
      user = build(:user, family_name: "ｱｲｳｴｵ")
        user.valid?
        expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "nameが全角日本語でないと保存できない" do
      user = build(:user, family_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "birthdayがない場合は登録できない" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end
