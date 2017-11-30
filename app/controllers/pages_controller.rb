class PagesController < ApplicationController
  # layout 'guest', only: [:home_guest, :profile_guest]

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
  end

  def profile_update
    if current_guest.update(user_params)
      sign_in(current_guest, bypass: true)
      redirect_to home_guest_path, notice: 'Profile Update!'
    else
      redirect_to profile_guest_path, alert: "Something went wrong! #{current_guest.errors.full_messages.join(' ')}"    end
  end

  def update
    @current_guest.save
  end

  private

  def user_params
    params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
