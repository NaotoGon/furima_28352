class ShipAddressOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number


  def save
    Ship_address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,order_id: order.id)
    Order.create(user_id: user.id, item_id: item.id)
  end
end