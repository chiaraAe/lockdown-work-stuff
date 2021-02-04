class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def unavailable_dates
    bookings.pluck(:starting_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
