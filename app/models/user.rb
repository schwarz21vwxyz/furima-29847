class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nick_name, presence: true
  validates :birthday, presence: true

  
  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角（漢字・ひらがな）で入力"}
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角（漢字・ひらがな）で入力"}
    validates :family_name_show, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角（カタカナ）で入力"}
    validates :name_show, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角（カタカナ）で入力"}
    validates :password, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数字で入力"}
  end
end
