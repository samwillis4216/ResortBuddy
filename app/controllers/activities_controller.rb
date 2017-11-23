class ActivitiesController < ApplicationController
  layout "guest"

  def index
    @category = params[:category]
    if params[:price].present?
      @price = params[:price]
      @activities = Activity.where("category iLIKE '%#{@category}%'").where("price <= #{@price}").order(price: :asc)
    else
      @activities = Activity.where("category iLIKE '%#{@category}%'").order(price: :asc)
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
