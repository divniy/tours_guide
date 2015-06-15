require 'rails_helper'

RSpec.describe CitiesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      city = City.create!(name: 'Moscow')
      get :show, id: city
      expect(response).to have_http_status(:success)
    end
  end

end
