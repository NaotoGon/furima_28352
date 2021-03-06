class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :birthday
    validates :email, uniqueness: true  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    VALID_NAME_REGEX = /[ぁ-んァ-ン一-龥]/
    validates :name, :fam_name, format: { with: VALID_NAME_REGEX }
    VALID_NAME_READING_REGEX = /([ァ-ン]|ー)/
    validates :name_reading, :fam_name_reading, format: { with: VALID_NAME_READING_REGEX }
  end

  has_many :items
end