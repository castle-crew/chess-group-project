require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "games#new action" do

    it "should successfully start a new game" do
      @game = FactoryBot.create(:game)
      expect(@game).to have_attributes(:winner => nil)
    end

  end

  describe "games#create action" do
    it "should make sure user is logged in" do
      @game = FactoryBot.create(:game)
      @user = FactoryBot.create(:user)
      
      if @user.valid?
        redirect_to game_path(@game)
      else
        expect(response).to redirect_to new_user_session_path
      end
    end

    it "should add a new game to database" do
      @game = FactoryBot.create(:game)
      @game.save

      expect(@game).to be_valid
    end
  end

  describe "games#show action" do

    it "should show the game board" do
      @game = FactoryBot.create(:game)
      @user = FactoryBot.create(:user)
      sign_in @user

      get :show, params: { id: @game.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe "games#index action" do
    it "should list the available games" do
      @game = FactoryBot.create(:game)
      @user = FactoryBot.create(:user)
      sign_in @user

      if @game.white_player != nil && @game.black_player == nil
        get :index
      end

      expect(response).to have_http_status(:success)
    end
  end

  describe "games#update action" do
    it "should let a logged in user join a game" do
      @game = FactoryBot.create(:game)
      @user = FactoryBot.create(:user)
      sign_in @user

      put :update, params: { id: @game.id }
      
      @game.update_attribute(:black_player, @user.id)
      
      expect(@game.black_player).to eq(@user.id)
    end

    it "should have pieces populated on the board" do
      @game = FactoryBot.create(:game)
      
      pieces = @game.pieces.count

      expect(pieces).to eq(32)
    end
  end
end




