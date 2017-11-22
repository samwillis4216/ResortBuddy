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

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :capacity, :price, :description, :duration, :photo, :photo_cache, :category)
  end

  def get_photo_file_name
    params.require(:activity).permit(:@original_filename)
  end

end
