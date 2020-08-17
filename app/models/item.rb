class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :during, :region, :ship_fee, :status

  #空の投稿を保存できないようにする
  validates :name, :image, :price, :text, :category, :during, :region, :ship_fee, :status, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category, :during, :region, :ship_fee, :status, numericality: { other_than: 0 } 
end
