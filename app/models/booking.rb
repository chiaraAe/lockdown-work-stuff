class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :starting_date, presence: true
  validates :end_date, presence: true
end
