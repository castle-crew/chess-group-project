require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe "boards#show action" do
    it "should successfully show the board" do
      get :show
      expect(response).to have_http:status(:success)
    end
  end
end
