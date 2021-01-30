class BookingsController < ApplicationController
  # Used as a Dashboard
  def index
    @bookings = Booking.select { |booking| booking.user == User.first }
  end

  # Do we need? 
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
  end


  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.item = @item
    # Change to current_user when signin works
    @booking.user = User.first

    if @booking.save!
      # UPDATE REDIRECT
      redirect_to bookings_path
    else
      render :new
    end 
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    # @item = Item.find(@booking.item_id)
    # @booking.item = @item
    @booking.destroy
    redirect_to bookings_path
  end

    private

  
  def booking_params
    params.require(:booking).permit(:starting_date, :end_date)
  end
end
