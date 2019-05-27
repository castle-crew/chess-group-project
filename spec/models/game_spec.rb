require 'rails_helper'

RSpec.describe Game, type: :model do

  describe "Game creation" do
    it "should put pieces on the board" do
      @game = FactoryBot.create(:game)

      pieces = @game.pieces.count

      expect(pieces).to eq(32)
  
    end
  end

  describe "game in_check?" do
    it "should successfully show king's color" do
      @white_king = FactoryBot.create(:white_king)

      expect(@white_king).to have_attributes(color => "white")
    end

    it "should tell if pawn position causes check" do
      @white_pawn = FactoryBot.create(:white_pawn)
      @black_king = FactoryBot.create(:black_king)

      check = @white_pawn.valid_move?(@black_king.x_space, @black_king.y_space)
      
      expect(check).to eq(true)
    end

    it "should tell if bishop position causes check" do
      @black_bishop = FactoryBot.create(:black_bishop)
      @white_king = FactoryBot.create(:white_king)

      check = @black_bishop.valid_move?(@white_king.x_space, @white_king.y_space)

      expect(check).to eq(true)
    end
  end
end
