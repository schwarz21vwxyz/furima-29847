class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :show
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image

  validates :image, :name, :comment, :user, presence: true

  with_options presence: true do
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Half-width number"}
  end

  validates_inclusion_of :price, in: 300..9999999, message: "Out of setting range"

  validates :category_id, numericality: { other_than: 1, message: "Select" } 
  validates :show_id, numericality: { other_than: 1 , message: "Select"} 
  validates :delivery_id, numericality: { other_than: 1 , message: "Select"} 
  validates :area_id, numericality: { other_than: 0 , message: "Select"} 
  validates :day_id, numericality: { other_than: 1 , message: "Select"} 
end
