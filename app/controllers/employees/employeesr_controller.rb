class EmployeesrController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:employee).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache, :role)
  end

  def account_update_params
    params.require(:employee).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache, :role)
  end
end
