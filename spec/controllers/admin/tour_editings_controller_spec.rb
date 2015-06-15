require 'rails_helper'

RSpec.describe Admin::TourEditingsController, type: :controller do
  describe 'GET #new' do
    it 'redirect to admin tours when noting to translate' do
      get :new
      expect(response).to redirect_to admin_tours_url
    end

    it 'returns success status' do
      @tour = Tour.create!(title: 'Some title', description: '')
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:tour_editing_form).tour).to eq(@tour)
    end
  end
end
