class Admin::BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @availabilities = Availability.all
    @activities = Activity.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
