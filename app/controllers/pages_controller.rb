class PagesController < ApplicationController
  skip_before_action :authenticate_guest!, only: [:home, :home_guest]
  def home

  end

  def home_guest

  end
end
