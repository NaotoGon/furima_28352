require 'rails_helper'

RSpec.describe ShipAddressOrder, type: :model do
  describe '#create' do
    before do
      @ship_address_order = FactoryBot.build(:ship_address_order)
    end

    it "全て記入すれば登録できること" do
      expect(@ship_address_order).to be_valid
    end

    it "postal_codeが空では登録できないこと" do
      @ship_address_order.postal_code = nil
      @ship_address_order.valid?
      expect(@ship_address_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeがハイフンなしでは登録できないこと" do
      @ship_address_order.postal_code = "1111111"
      @ship_address_order.valid?
      expect(@ship_address_order.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefecture_idが0では登録できないこと" do
      @ship_address_order.prefecture_id = 0
      @ship_address_order.valid?
      expect(@ship_address_order.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it "cityが空では登録できないこと" do
      @ship_address_order.city = nil
      @ship_address_order.valid?
      expect(@ship_address_order.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空では登録できないこと" do
      @ship_address_order.house_number = nil
      @ship_address_order.valid?
      expect(@ship_address_order.errors.full_messages).to include("House number can't be blank")
    end
  
    it "phone_numberが空では登録できないこと" do
      @ship_address_order.phone_number = nil
      @ship_address_order.valid?
      expect(@ship_address_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが12けた以上では登録できないこと" do
      @ship_address_order.phone_number = "123456789012"
      @ship_address_order.valid?
      expect(@ship_address_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
