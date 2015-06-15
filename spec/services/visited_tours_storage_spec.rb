require 'rails_helper'

describe VisitedToursStorage do
  before(:example) do
    @storage = VisitedToursStorage.new({})
  end

  it 'initialize with hash' do
    expect(@storage).to be
  end

  it 'properly add tour id' do
    @storage.add_tour_id(3)
    @storage.add_tour_id(5)
    @storage.add_tour_id(5)
    @storage.add_tour_id(10)
    expect(@storage.tour_ids).to eq([10, 5, 3])
  end

  it 'removes tour id' do
    @storage.add_tour_id(3)
    @storage.remove_tour_id(3)
    expect(@storage.tour_ids).to eq([])
  end

  it 'returns tours without current' do
    tour1 = Tour.create! title: 'Title 1'
    tour2 = Tour.create! title: 'Title 2'
    tour3 = Tour.create! title: 'Title 3'
    @storage.add_tour_id(tour1.id)
    @storage.add_tour_id(tour2.id)
    @storage.add_tour_id(tour3.id)
    expect(@storage.tours_without_current(tour2.id)).to eq([tour3, tour1])
  end
end