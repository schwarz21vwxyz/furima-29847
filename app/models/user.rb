class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_one_attached :image

  validates :nick_name, presence: true
  validates :birthday, presence: true

  
  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :family_name_show, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :name_show, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i, message: "Include both letters and numbers"}
  end

end
