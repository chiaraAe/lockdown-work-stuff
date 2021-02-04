class BookingsController < ApplicationController
  before_action :authenticate_user!

  # Used as a Dashboard
  def index
    @items = Item.select { |item| item.user == current_user}
    @bookings = Booking.select { |booking| booking.user == current_user }
  end 

  # Do we need?
  # def show
  #   @booking = Booking.find(params[:id])
  # end

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = "Dates already booked"
      redirect_to item_path(@item)
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :end_date)
  end
end
