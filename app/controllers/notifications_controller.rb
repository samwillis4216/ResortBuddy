class NotificationsController < ApplicationController

  def mark_as_read
    user = current_guest ? current_guest : current_employee
    user.received_notifications.each do |notification|
      notification.update(read: true)
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def mark_as_cleared
    user = current_guest ? current_guest : current_employee
    user.received_notifications.each do |notification|
      notification.update(read: true, cleared: true)
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

end
