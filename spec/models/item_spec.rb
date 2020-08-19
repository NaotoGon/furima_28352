require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload(('app/assets/images/item_test.png'))
    end

    it "全て記入すれば登録できること" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "textが空では登録できないこと" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが300円未満では登録できないこと" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが9999999円以上では登録できないこと" do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "status_idが空では登録できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "ship_fee_idが空では登録できないこと" do
      @item.ship_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship fee can't be blank")
    end

    it "region_idが空では登録できないこと" do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end

    it "during_idが空では登録できないこと" do
      @item.during_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("During can't be blank")
    end

    it "categoryが---では登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it "statusが---では登録できないこと" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end

    it "ship_feeが---では登録できないこと" do
      @item.ship_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship fee must be other than 0")
    end

    it "regionが---では登録できないこと" do
      @item.region_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 0")
    end

    it "duringが---では登録できないこと" do
      @item.during_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("During must be other than 0")
    end


    it "画像が空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image ファイルを添付してください")
    end
  end
end