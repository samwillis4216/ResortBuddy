class Admin::ActivitiesController < ApplicationController
  layout "admin"

  before_action :authenticate_employee!

  def index
    @activities = Activity.all
  end

  def show
  @activity = Activity.find(params[:id])
  end

 def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.employee = current_employee
    if @activity.save
      redirect_to admin_activity_path(@activity)
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def my_activities
  end

  def my_activities2
    @my_availabilities = Availability.where('employee_id = ?', current_employee.id)
    # @ppl = Booking.where("availability_id = #{availability.id}")
    # @sumofppl = 0
    # @ppl.each do |i|
    # @sumofppl += i.no_ppl
    # end
  end



  private

  def activity_params
    params.require(:activity).permit(:name, :location, :capacity, :price, :description, :duration, :photo, :photo_cache, :category)
  end

  def get_photo_file_name
    params.require(:activity).permit(:@original_filename)
  end

end
