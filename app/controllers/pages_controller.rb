class PagesController < ApplicationController
  layout 'guest', only: :home_guest

  def home
    # if guest_signed_in?
    #   redirect_to home_guest_path
    # elsif employee_signed_in?
    #   # redirect_to
    # end
  end

  def home_guest


  end
end
