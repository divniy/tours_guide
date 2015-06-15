class City < ActiveRecord::Base
  has_many :tours
  has_many :published_tours, ->{ published }, class_name: Tour

  validates :name, presence: true, uniqueness: true
end
