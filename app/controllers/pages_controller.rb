class PagesController < ApplicationController
  skip_before_action :authenticate_guest!, only: :home
  def home

  end
end
