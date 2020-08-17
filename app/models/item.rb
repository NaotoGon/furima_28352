class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :during
  belongs_to_active_hash :region
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :status


  validates :name, :price, :text, :category_id, :during_id, :region_id, :ship_fee_id, :status_id, presence: true
  validates :category_id, :during_id, :region_id, :ship_fee_id, :status_id, numericality: { other_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }

end
