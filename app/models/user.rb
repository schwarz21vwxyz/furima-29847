class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :family_name, presence: true
  validates :name, presence: true
  validates :family_name_show, presence: true
  validates :name_show, presence: true
  validates :birthday, presence: true

end
