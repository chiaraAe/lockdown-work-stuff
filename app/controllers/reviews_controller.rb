class ReviewsController < ApplicationController
  
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end  

  
  def create
      @review = Review.new(review_params)
      @booking = Booking.find(params[:booking_id])

      @review.user = current_user
      @review.booking = @booking
      @review.item = @booking.item


      if @review.save!
        redirect_to bookings_path
      else
        render 'items/show'
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:content)
    end
end

