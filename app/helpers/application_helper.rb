module ApplicationHelper

  def booking_availability(starting_date, end_date, attrs = nil)   
    current_date = Date.today

    if attrs == nil
      true
    elsif current_date.between?(starting_date, end_date)
      false
    else 
      true
    end

  end 

end
