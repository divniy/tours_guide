class Tour < ActiveRecord::Base
  belongs_to :city
  has_many :tour_categories
  has_many :categories, through: :tour_categories
  has_many :tour_editings, dependent: :destroy
  attr_accessor :editor

  validates :title, presence: true
  after_save :track_editings

  scope :published, ->{ where(published: true) }
  scope :without_description, ->{ where(description: [nil, '']) }

  attr_reader :city_name, :category_names

  def city_name=(name)
    return unless name.present?
    self.city = City.find_or_initialize_by(name: name.strip.mb_chars.capitalize)
  end

  def category_names=(names)
    new_categories = names.split(',').map{|name| Category.find_or_initialize_by(name: name.strip.mb_chars.capitalize)}
    self.categories = categories | new_categories
  end

  private

  def track_editings
    if description_changed?
      tour_editings.create(user: editor, description: description)
    end
  end
end
