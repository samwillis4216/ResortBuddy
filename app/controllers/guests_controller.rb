class GuestsController < ApplicationController

  private

  def guest_params
    params.require(:guest).permit(:email, :first_name, :last_name, :photo, :photo_cache)
  end

end
