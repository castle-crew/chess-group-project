require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  
  describe "games#new action" do

    it "should successfully start a new game" do
      @game = FactoryBot.create(:game)
      expect(@game).to have_attributes(:winner => nil)
    end

    it "should successfully place pieces on board" do
      @game = FactoryBot.create(:game)
      # piece = FactoryBot.create(:piece)

      pieces = @game.piece.count

      expect(pieces).to_eq (32)



      # expect(@game).to have_attributes(:winner => nil)

      # white_king = FactoryBot.create(:king)
      
      # expect(white_king).to have_attributes(:color => true)
      #expect(black_king).to have_color(:false)
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

      get :show, params: { id: @game.game_id }

    end
  end
end



