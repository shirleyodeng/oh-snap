class BookingsController < ApplicationController
  def create
    @booking = Booking.create(booking_params)
    @booking.photographer = params[:photographer_id]
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :hours, :location)
  end
end
