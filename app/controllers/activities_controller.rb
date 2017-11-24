class ActivitiesController < ApplicationController
  layout 'guest', :only => [:show]
  layout 'activities_index', :only => [:index]

  def filter
    @activities = Activity.all
  end

  def index
    @category = params[:category]
    @price = params[:price]

    if params[:category] && params[:price]
      @activities = Activity.where(category: @category.map(&:capitalize)).where("price <= #{@price}").order(price: :asc)
    elsif params[:category]
      @activities = Activity.where(category: @category.map(&:capitalize)).order(price: :asc)
    else
      @activities = Activity.all
    end
  end

  def show
    @booking = Booking.new
    @date = Date.parse(params[:date])
    @activity = Activity.find(params[:id])
    @availabilities = @activity.availabilities.where("start_time > ? AND start_time < ?", @date, @date + 1)
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

  def my_activities
  end

  def rerender
    @date = Date.parse(params[:date])
    @activity = Activity.find(params[:id])
    @availabilities = @activity.availabilities.where("start_time > ? AND start_time < ?", @date, @date + 1)
  end
end
