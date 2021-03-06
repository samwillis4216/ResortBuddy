class Admin::AvailabilitiesController < ApplicationController

  def index
    @availabilities = Availability.where(activity_id: params[:activity_id])
    @activity_id = params[:activity_id]
  end

  def show
    @availability = Availability.find(params[:id])
    @chatroom = Chatroom.find(@availability.chatroom.id)
    @message = Message.new
    @messages = @chatroom.messages
    @activity = Activity.find(params[:activity_id])
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @availability = Availability.new
  end


  def create
    @activity = Activity.find(params[:activity_id])
    start_time = Time.parse(params[:availability][:start_time])
    end_time = Time.parse(params[:availability][:end_time])
    employee = Employee.find(params[:availability][:employee_id])
    4.times do

      availability = Availability.new(availability_params)
      availability.start_time = start_time
      availability.end_time = end_time
      availability.activity = @activity
      availability.employee = employee
      if availability.save
        chatroom = Chatroom.create!(availability: availability)
      else
        render :new
      end

      start_time += 7.day
      end_time += 7.day
    end
    redirect_to admin_activity_path(@activity)
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

