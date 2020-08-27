require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
      @ship_address = FactoryBot.build(:ship_address)
    end

    it "全て記入すれば登録できること" do
      expect(@order).to be_valid
    end

    it "postal_codeが空では登録できないこと" do
      @ship_address.postal_code = nil
      binding.pry
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeがハイフンなしでは登録できないこと" do
      @ship_address.postal_code = 1111111
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "prefecture_idが0では登録できないこと" do
      @ship_address.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it "cityが空では登録できないこと" do
      @ship_address.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空では登録できないこと" do
      @ship_address.house_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end
  
    it "phone_numberが空では登録できないこと" do
      @ship_address.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
