class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cars, foreign_key: :owner_id, dependent: :destroy
  has_many :rides, dependent: :destroy
  # validates :license_number, uniqueness: true
end
