class Admin::TourEditingsController < Admin::ApplicationController
  before_action :set_tour, only: [:index, :create]
  before_action :redirect_if_all_descripted, only: :new

  def index
    @tour_editings = @tour.tour_editings.order(:created_at)
  end

  def new
    @tour_editing_form = TourEditingForm.new Tour.without_description.first
  end

  def create
    @tour_editing_form = TourEditingForm.new(@tour)
    if @tour_editing_form.submit(tour_editing_form_params)
      redirect_to action: :new
    else
      render :new
    end
  end

  private

  def redirect_if_all_descripted
    if Tour.without_description.empty?
      redirect_to admin_tours_url, notice: 'Все предложения переведены'
    end
  end

  def set_tour
    @tour = Tour.find(params[:tour_id])
  end

  def tour_editing_form_params
    params.require(:tour_editing_form).permit(:description).merge(editor: current_user)
  end
end
