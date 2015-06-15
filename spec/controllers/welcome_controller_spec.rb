require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    before(:example) do
      @moscow = City.create!(name: 'Москва')
      @moscow.tours.create!(title: 'Moscow tour', published: true)
      @adler = City.create!(name: 'Адлер')
      @adler.tours.create!(title: 'Adler tour', published: true)
      @unpublished_city = City.create!(name: 'City 1')
      @unpublished_city.tours.create!(title: 'Some tour', published: false)
      @empty_city = City.create!(name: 'City 2')
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'loads proper cities into @cities' do
      get :index
      expect(assigns(:cities)).to match_array([@adler, @moscow])
    end
  end
end
