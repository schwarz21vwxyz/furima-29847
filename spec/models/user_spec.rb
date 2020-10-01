RSpec.describe User, type: :model do
  describe 'User' do
    before do
      @user = FactoryBot.build(:user)
    end
  
    it "nick_nameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick_name can't be blank")
    end

    it "emailが空では登録できない" do
    end
    it "emailに＠を含んでないと登録できない" do
    end
    it "passwardが空だと登録できない" do
    end
    it "passwardが６文字以上でないと登録できない" do
    end
    it "passwardが半角英数字混合でないと登録できない" do
    end
    it "family_nameが空だと登録できない" do
    end
    it "nameが空だと登録できない" do
    end
    it "family_nameが全角日本語でないと保存できないこと" do
    end
    it "nameが全角日本語でないと保存できないこと" do
    end
  end
end
