module ApplicationHelper
  def resource_name_guest
    :guest
  end

  def resource_guest
    @resource ||= Guest.new
  end

  def devise_mapping_guest
    @devise_mapping ||= Devise.mappings[:guest]
  end

  def resource_name_employee
    :employee
  end

  def resource_employee
    @resource ||= Employee.new
  end

  def devise_mapping_employee
    @devise_mapping ||= Devise.mappings[:employee]
  end
end
