class CitiesController < ApplicationController
  def show
    @city = City.includes(published_tours: :categories).find params[:id]
    @tours = @city.published_tours
  end
end
