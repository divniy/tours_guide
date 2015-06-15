class TourCategory < ActiveRecord::Base
  belongs_to :tour
  belongs_to :category
end
