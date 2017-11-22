class RegistrationsController < Devise::RegistrationsController

  private
    # For additional fields in app/views/devise/registrations/new.html.erb
    def sign_up_params
      params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache)
    end

    def account_update_params
      params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache)
    end

end
