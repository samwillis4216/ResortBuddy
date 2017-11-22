class Admin::AvailabilitiesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @availability = Availability.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    start_time = Time.parse(params[:availability][:start_time])
    end_time = Time.parse(params[:availability][:end_time])
    @availability = Availability.new(availability_params)
    @availability.start_time = start_time
    @availability.end_time = end_time
    @availability.activity = @activity
    @availability.employee = current_employee
    if @availability.save
      redirect_to admin_activity_path(@activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private

  def set_availability
    @availability = Availability.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:start_time, :end_time)
  end
end

