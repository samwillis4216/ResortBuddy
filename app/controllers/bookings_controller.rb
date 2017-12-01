class BookingsController < ApplicationController

  def index
    @user = current_guest
    @bookings = Booking.where("guest_id = #{@user.id}").joins(:availability).merge(Availability.order(start_time: :asc))
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @availability = Availability.find(params[:availability_id])
    @booking = Booking.new
  end

  def create
    binding.pry
    @availability = Availability.find(params[:booking][:availability_id])
    @booking = Booking.new(booking_params)
    @booking.guest = current_guest
    @booking.availability = @availability
    @booking.save
    flash[:notice] = "£#{@availability.activity.price * @booking.no_ppl} has been added to your room."
    redirect_to bookings_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:no_ppl)
  end
end
