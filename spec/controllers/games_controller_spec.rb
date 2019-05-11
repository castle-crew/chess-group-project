require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  
  describe "games#new action" do

    it "should successfully start a new game" do
      game = FactoryBot.create(:game)
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create action" do
    it "should make sure user is logged in" do
      @game = FactoryBot.create(:game)
      
      post :create
      expect(response).to redirect_to new_user_session_path
    end

    it "should add a new game to database" do
      @game = FactoryBot.create(:game)
      #FINISH

    end
  end

  describe "games#show action" do

    it "should make sure a valid user is logged in" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)

      if user.valid?
        expect(response).to redirect_to game_path
      else
        expect(response).to redirect_to new_user_session_path
      end
    end

    it "should successfully show the game board" do
      game = FactoryBot.create(:game)
      get :show, params: { id: game_id } #params: game_params #
      expect(response).to redirect_to game_path
    end
  end
end



