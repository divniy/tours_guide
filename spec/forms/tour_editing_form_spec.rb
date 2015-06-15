require 'rails_helper'

RSpec.describe TourEditingForm do
  it 'initialize with tour' do
    tour = Tour.new
    form = TourEditingForm.new(tour)
    expect(form.tour).to eq(tour)
  end

  it 'delegates title and description to tour' do
    tour = Tour.new title: 'Some Title', description: 'Some description'
    form = TourEditingForm.new(tour)
    expect(form.title).to eq('Some Title')
    expect(form.description).to eq('Some description')
  end

  it 'invalid without description' do
    tour = Tour.new title: 'Some Title'
    form = TourEditingForm.new(tour)
    expect(form.valid?).to be_falsey
    expect(form.errors[:description]).to be
  end

  it 'save underlying tour on submit params' do
    tour = Tour.create title: 'Some Title'
    form = TourEditingForm.new(tour)
    form.submit(description: 'Some description')
    expect(tour.persisted?).to be_truthy
    expect(tour.description).to eq('Some description')
  end
end