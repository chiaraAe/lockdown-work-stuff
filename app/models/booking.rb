class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :starting_date, :end_date, presence: true

  # validate  :validate_dates

  # def data_ranges
  #   # Fetching all Bookings for the item // checked with raise -> works
  #   bookings = Booking.where(["item_id =?", item_id])
  #   # Extracting all starting and end date // checked with raise -> works # gives me an array of arrays
  #   date_ranges = bookings.map { |b| b.starting_date..b.end_date }
  # end

  # def validate_dates
  #   # Fetching all Bookings for the item // checked with raise -> works
  #   bookings = Booking.where(["item_id =?", item_id])
  #   # Extracting all starting and end date // checked with raise -> works # gives me an array of arrays
  #   date_ranges = bookings.map { |b| b.starting_date..b.end_date }
  #   # iterating throuhg all starting and end dates -> doesnt work
  #   date_ranges.each do |range|
  #     if (range.include?(starting_date) || range.include?(end_date)) || (starting_date < range.first && end_date > range.last)
  #       return errors.add :base, "ALREADY BOOKED!" 
  #     end
  #   end

  # end

end
