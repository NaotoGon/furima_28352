require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全て記入すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "name_readingが空では登録できないこと" do
      @user.name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading can't be blank")
    end

    it "name_readingがカタカナ以外では登録できないこと" do
      @user.name_reading = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading is invalid")
    end

    it "fam_nameが空では登録できないこと" do
      @user.fam_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam name can't be blank")
    end

    it "fam_name_readingが空では登録できないこと" do
      @user.fam_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam name reading can't be blank")
    end

    it "fam_name_readingがカタカナ以外では登録できないこと" do
      @user.fam_name_reading = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fam name reading is invalid")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに＠がなければ登録できないこと" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
