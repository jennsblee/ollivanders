class BookingsController < ApplicationController
  def new
    @wand = Wand.find(params[:wand_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.wand = Wand.find(params[:wand_id])

    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_out, :check_in)
  end
end
