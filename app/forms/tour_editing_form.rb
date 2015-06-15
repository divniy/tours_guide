class TourEditingForm
  include ActiveModel::Model
  attr_reader :tour
  delegate :title, :description, to: :tour
  validates :description, presence: true

  def initialize(tour)
    @tour = tour
  end

  def submit(params)
    tour.assign_attributes(params)
    if valid? && tour.valid?
      tour.save
    else
      false
    end
  end
end