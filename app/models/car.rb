class Car < ApplicationRecord
  belongs_to :user
  has_many :rides
  has_many :reviews

  validates :name, :brand, :model, :year, :description, :price, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
