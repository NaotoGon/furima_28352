FactoryBot.define do
  factory :ship_address_order do
    postal_code { "111-1111" }
    prefecture_id { 1 }
    city { Gimei.address.city.kanji }
    house_number {Gimei.address.town.kanji }
    building_name {Gimei.name.kanji}
    phone_number { "12345678901" }
  end
end