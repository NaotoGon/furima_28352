FactoryBot.define do
  # user = FactoryBot.create(:user)
  factory :item do
    name {Gimei.name.first}
    price { 1000 }
    text { Faker::Lorem.sentence}
    category_id { 4 }
    status_id { 4 }
    ship_fee_id { 4 }
    region_id { 4 }
    during_id { 4 }
    
  end
end
