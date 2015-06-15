class Admin::ToursController < Admin::ApplicationController
  before_action :find_tour, only: [:edit, :update, :destroy]

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to admin_tours_url, notice: "Экскурсия '#{@tour.title}' успешно создана"
    else
      render :new
    end
  end

  def update
    if @tour.update(tour_params)
      redirect_to admin_tours_url, notice: "Экскурсия '#{@tour.title}' успешно изменена"
    else
      render :edit
    end
  end

  def destroy
    @tour.destroy
    redirect_to admin_tours_url, notice: "Экскурсия '#{@tour.title}' успешно удалена"
  end

  private

  def find_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    permit_fields = [:title, :description, :published, :city_id, :city_name, {category_ids: []}, :category_names]
    params.require(:tour).permit(permit_fields).merge(editor: current_user)
  end
end
