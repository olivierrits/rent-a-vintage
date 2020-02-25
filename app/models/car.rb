class Car < ApplicationRecord
  belongs_to :user
  # has_many :rides
  # has_many :reviews

  validates :name, :brand, :model, :year, :description, :price, presence: true
end
