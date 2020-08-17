class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :during_id
  belongs_to_active_hash :region_id
  belongs_to_active_hash :ship_fee_id
  belongs_to_active_hash :status_id

  #空の投稿を保存できないようにする
  validates :name, :price, :text, :category_id, :during_id, :region_id, :ship_fee_id, :status_id, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :during_id, :region_id, :ship_fee_id, :status_id, numericality: { other_than: 0 } 
end
