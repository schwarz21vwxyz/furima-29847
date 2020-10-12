class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :show
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :image, :name, :comment, :user, presence: true

  with_options presence: true do
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number"}
  end

  validates_inclusion_of :price, in: 300..9999999, message: "Out of setting range"

  with_options numericality: { other_than: 1, message: "Select" } do
    validates :category_id
    validates :show_id
    validates :delivery_id
    validates :day_id
  end

  validates :area_id, numericality: { other_than: 0 , message: "Select"} 
end
