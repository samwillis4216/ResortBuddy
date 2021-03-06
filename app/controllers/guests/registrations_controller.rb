class Guests::RegistrationsController < Devise::RegistrationsController
 private

  def sign_up_params
    params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache)
  end

  def account_update_params
    params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache)
  end
end
