require 'rails_helper'

RSpec.describe Tour, type: :model do
  describe 'city_name=' do
    it 'set city by name' do
      tour = Tour.new(city_name: 'Moscow')
      expect(tour.city.name).to eq('Moscow')
    end

    it 'finds existent city' do
      city = City.create! name: 'Moscow'
      tour = Tour.new(city_name: 'Moscow')
      expect(tour.city.id).to eq(city.id)
    end

    it 'ignore empty name' do
      tour = Tour.new city_name: ''
      expect(tour.city).not_to be
    end
  end

  describe 'category_names=' do
    it 'add categories' do
      category = Category.create!(name: 'First')
      tour = Tour.new(categories: [category], category_names: 'second, third')
      expect(tour.categories.map(&:name)).to eq(['First', 'Second', 'Third'])
    end

    it 'removes duplicate categories' do
      category = Category.create!(name: 'First')
      tour = Tour.new(categories: [category], category_names: 'First')
      expect(tour.categories.map(&:name)).to eq(['First'])
    end
  end

  describe 'track editings' do
    it 'create tour editing' do
      user = User.create!(email: 'divniy@gmail.com', password: 'pass')
      tour = Tour.create!(title: 'Title', description: 'Some text', editor: user)
      expect(tour.tour_editings.count).to eq(1)
      expect(tour.tour_editings.first.description).to eq('Some text')
      expect(tour.tour_editings.first.user).to eq(user)
    end
  end
end
