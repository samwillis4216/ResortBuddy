class Admin::BookingsController < ApplicationController
  layout "admin"

  def index
    @bookings = Booking.all
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
