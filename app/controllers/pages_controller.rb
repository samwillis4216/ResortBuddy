class PagesController < ApplicationController
  skip_before_action :authenticate_guest!, only: :home
  def home
    # if guest_signed_in?
    #   redirect_to home_guest_path
    # elsif employee_signed_in?
    #   # redirect_to
    # end
  end
end
