class WelcomeController < ApplicationController
  def index
    @cities = City.joins(:published_tours).includes(:published_tours).distinct.order(:name)
  end
end
