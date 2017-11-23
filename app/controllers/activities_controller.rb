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
end
