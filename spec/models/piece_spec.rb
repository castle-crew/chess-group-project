require 'rails_helper'
require 'support/shared_examples_for_pieces.rb'

RSpec.describe Piece, type: :model do

  describe "piece population" do
    it "should successfully add 14 total pawns to game" do
      game = FactoryBot.create(:game)
      pawns = game.pieces.pawns.count

      expect(pawns).to eq(16)
    end

    it "should successfully add 4 total rooks to game" do
      game = FactoryBot.create(:game)
      rooks = game.pieces.rooks.count

      expect(rooks).to eq(4)
    end
  end
end
