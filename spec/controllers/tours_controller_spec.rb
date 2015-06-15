require 'rails_helper'

RSpec.describe ToursController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      tour = Tour.create(title: 'Some title')
      get :show, id: tour
      expect(response).to have_http_status(:success)
    end
  end

end
