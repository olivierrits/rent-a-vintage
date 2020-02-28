class Car < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :rides, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :brand, :model, :year, :description, :price, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
