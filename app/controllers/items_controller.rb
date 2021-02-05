class ItemsController < ApplicationController
  def index
    @items = Item.all
      @markers = @items.geocoded.map do |item|
    {
      lat: item.latitude,
      lng: item.longitude,
      infoWindow: render_to_string(partial: "/items/info_window", locals: { item: item })
    }
      end
  end

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    @reviews = @item.reviews
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to bookings_path
    else
      redirect_to items_path(@item)
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to bookings_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to bookings_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :category, :description, :price, :address, photos: [])
  end
end
