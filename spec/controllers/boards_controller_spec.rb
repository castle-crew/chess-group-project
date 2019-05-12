require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe "boards#show action" do
    it "should successfully show the board" do
      get :show
      expect(response).to have_http:status(:success)
    end
  end

  describe "boards#create action" do
    it "should successfully create a new chess board for a game" do
      post :create, params: {board: { board_id: '1' } }
      expect(response).to redirect_to game_path
    end
  end
end
