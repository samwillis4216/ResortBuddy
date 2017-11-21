class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @search = params[:q]
  end
end
