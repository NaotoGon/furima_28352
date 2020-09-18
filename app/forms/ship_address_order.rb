class ShipAddressOrder

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city, :house_number
    validates :prefecture_id, numericality: { other_than: 0 }
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}$\Z/
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
    validates :phone_number, length: { maximum: 11 }
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,phone_number: phone_number, order_id: order.id)
  end
end