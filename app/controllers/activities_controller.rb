class ActivitiesController < ApplicationController

  def filter
    @date = Date.parse(params[:date])
    @activities = Activity.all
    @activitiesForFilter = @activities.select {|activity| activity.availabilities.any? {|availability| availability.start_time.to_date == @date}}
    render layout: 'activities_filter'
  end

  def count
    date = Date.parse(params[:date])
    activities = Activity.where(category: params[:category]&.map(&:capitalize)).where("price <= ?", params[:price]).where("capacity >= ?", params[:capacity])
    activities = activities.select {|activity| activity.availabilities.any? {|availability| availability.start_time.to_date == date}}
    render json: {count: activities.length}
  end

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @category = params[:category]
    @price = params[:price]
    @numpeople = params[:numpeople]
    if params[:price] && params[:numpeople]
      # this will only be run once a filter form has been submitted

      if params[:price] != 0
        @activities = Activity.where(category: @category&.map(&:capitalize)).where("price <= ?", @price).order(price: :asc).where("capacity >= ?", @numpeople).order(capacity: :asc)
        @activities = @activities.select {|activity| activity.availabilities.any? {|availability| availability.start_time.to_date == @date}}
        @filter_flag = @activities.any?
        @first_enter_flag = false;
      else
        @activities = Activity.where(category: @category&.map(&:capitalize)).where("price = ?", 0).where("capacity >= ?", @numpeople).order(capacity: :asc)
        @activities = @activities.select {|activity| activity.availabilities.any? {|availability| availability.start_time.to_date == @date}}
        @filter_flag = @activities.any?
        @first_enter_flag = false;
      end
    else
      @activities = Activity.all
      @activities = @activities.select {|activity| activity.availabilities.any? {|availability| availability.start_time.to_date == @date}}
      @first_enter_flag = true;
    end
    render layout: 'activities_index'
  end

  def show
    @booking = Booking.new
    @date = Date.parse(params[:date])
    @activity = Activity.find(params[:id])
    @availabilities = @activity.availabilities.where("start_time > ? AND start_time < ?", @date, @date + 1)
    render layout: 'guest'
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

  def rerender
    @date = Date.parse(params[:date])
    @activity = Activity.find(params[:id])
    @availabilities = @activity.availabilities.where("start_time > ? AND start_time < ?", @date, @date + 1)
  end
end
