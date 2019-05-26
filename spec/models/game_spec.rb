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


  end
end
