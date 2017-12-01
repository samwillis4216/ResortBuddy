class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.class == Guest
      home_guest_path
    elsif resource.class == Employee
      admin_activities_path
    else
      root_path
    end
  end

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

end
