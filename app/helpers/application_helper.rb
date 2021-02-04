module ApplicationHelper

  def booking_availability(starting_date, end_date)   
    current_date = Date.today
    if current_date.between?(starting_date, end_date)
      false
    else 
      true
    end
  end 

  def currently_booked(item)
    current_date = Date.today
    # if there is no booking => the item is available
    # if the current date is not within hte rage of a booking => the item is available
    if current(item) == false
      return false
    # if the current date is in the range of a booking ==> booked
    elsif current(item) == true
      return true
    elsif item.bookings.empty?
        return false
    end
  end 

  def current(item)
    current_date = Date.today
    # Fetching all Bookings for the item // checked with raise -> works
    bookings = item.bookings

    date_hash = bookings.map do |booking| {
      :starting_date => booking.starting_date, 
      :end_date => booking.end_date 
      }
    end
    
    date_hash.each do |range| 
      # if current_date is between start and end than the item is currently booked => not available
      if current_date.between?(range[:starting_date], range[:end_date])
        return true 
      else 
        return false
      end 
    end
  end

end
