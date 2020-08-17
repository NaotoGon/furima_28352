class Ship_fee < ActiveHash::Base
  self.data = [
    {id: 0, name: "---" },
    {id: 0, name: "着払い(購入者負担)" },
    {id: 0, name: "送料込み(発送者負担)" }
  ]
end
