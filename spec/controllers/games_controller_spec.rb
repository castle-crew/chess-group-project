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
    end
  end

  describe "games#show action" do

    it "should show the game board" do
      @game = FactoryBot.create(:game)
      @user = FactoryBot.create(:user)
      sign_in @user
      get :show, params: { id: @game.id } 

      expect(response).to redirect_to game_path(@game)
    end

    it "should have pieces populated on the board" do
      @game = FactoryBot.create(:game)
      
      pieces = @game.pieces.count

      expect(pieces).to eq(32)
    end
  end
end



