class Item < ApplicationRecord
  CATEGORIES = ['Electronics', 'Furniture', 'Pets & Plants']
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unavailable_dates
    bookings.pluck(:starting_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end