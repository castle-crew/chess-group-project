require 'rails_helper'

RSpec.describe Game, type: :model do

  describe "Game creation" do
    it "should put pieces on the board" do
      @game = FactoryBot.create(:game)

      pieces = @game.pieces.count

      expect(pieces).to eq(32)
      # expect(@game).to have_attributes(:Piece => :King)
      # expect(:King).to have_attributes(:x_space => 4, :y_space => 0)
    end
  end
end
