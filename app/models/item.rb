class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :show
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user

  validates :name, :comment, :price, :user, presence: true

  validates :category_id, :show_id, :delivery_id, :delivery_id, numericality: { other_than: 1 } 

  validates :area_id, numericality: { other_than: 0 } 

end
