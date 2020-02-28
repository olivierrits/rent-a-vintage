class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many_attached :photos

  validates :rating, inclusion: { in: 0..5 }
  validates :comment, presence: true
end
