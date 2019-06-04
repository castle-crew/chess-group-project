require 'rails_helper'
require 'support/shared_examples_for_pieces.rb'

RSpec.describe Piece, type: :model do

describe "game check?" do
    it "should successfully identify the king color" do
      game = FactoryBot.create(:game)
      kings = game.pieces.kings
      colors = kings.map { |piece| piece.color }

      expect(colors).to include("white", "black")
    end

    it "should know there are 2 kings on the board" do
      game = FactoryBot.create(:game)
      kings = game.pieces.kings.count

      expect(kings).to eq(2)
    end

    it "should detect the kings in the proper game" do
      game = FactoryBot.create(:game)
      kings = game.pieces.kings
      id = kings.map { |piece| piece.game_id }

      expect(id).to include(game.id)
    end

    it "should return true if king under attack" do
      game = FactoryBot.create(:game)
      kings = game.pieces.kings
      colors = kings.map { |piece| piece.color }
      white_king = kings.colors.fetch(1)
      puts white_king

    end
  end
end
