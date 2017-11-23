class PagesController < ApplicationController
  layout 'guest', only: [:home_guest, :profile_guest]

  before_action :authenticate_guest!, only: :home_guest

  def home
    if current_guest
      return redirect_to home_guest_path
    elsif employee_signed_in?
      return redirect_to admin_activities_path
    end
  end

  def home_guest
  end

  def profile_guest
    @current_guest = current_guest
  end


end
