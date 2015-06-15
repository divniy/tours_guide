class ToursController < ApplicationController
  before_action :set_visited_tours, only: :show

  def show
    @tour = Tour.find(params[:id])
  end

  def remove_visited
    VisitedToursStorage.new(session).remove_tour_id(params[:id])
    redirect_to :back
  end

  private

  def set_visited_tours
    @visited_tours = VisitedToursStorage.new(session).add_tour_id(params[:id]).tours_without_current(params[:id], 3)
  end
end
