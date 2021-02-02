class Item < ApplicationRecord
  CATEGORIES = ['Electronics', 'Furniture', 'Pets & Plants']
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many_attached :photos
end
