class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :starting_date, :end_date, presence: true


end
