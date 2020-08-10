class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :password, presence: true
  validates :email, uniqueness: true  
  validates :email, inclusion: { in: %w(@) }
  validates :password, confirmation: true
end