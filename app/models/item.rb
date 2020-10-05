class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :show
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :days
end
