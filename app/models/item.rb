class Item < ApplicationRecord
 


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

  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  belongs_to :user
  has_one_attached :image
end
