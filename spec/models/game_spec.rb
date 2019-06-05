require 'rails_helper'
require 'support/shared_examples_for_pieces.rb'

RSpec.describe Game, type: :model do

  describe "game#new" do
    it "should put pieces on the board" do
      game = FactoryBot.create(:game)
      pieces = game.pieces.count

      expect(pieces).to eq(32)
    end
  end

  describe "method check?" do
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

    it "should return true if white king in check by black bishop" do
      game = FactoryBot.create(:game)
      king = game.pieces.find_by(color: "white", type: "King")
      bishop = game.pieces.find_by(color: "black", x_space: 5, y_space: 0, type: "Bishop")
      bishop.update_piece_location(3,6)

      expect(bishop.legal_move?(4,7)).to be(true)
    end

    it "should return true if black king in check by white bishop" do
      game = FactoryBot.create(:game)
      king = game.pieces.find_by(color: "black", type: "King")
      bishop = game.pieces.find_by(color: "white", x_space: 5, y_space: 7, type: "Bishop")
      bishop.update_piece_location(5,6)

      expect(bishop.legal_move?(4,7)).to be(true)
    end

    it "should return true if black king in check by white rook" do
      game = FactoryBot.create(:game)
      king = game.pieces.find_by(color: "black", type: "King")
      rook = game.pieces.find_by(color: "white", x_space: 0, y_space: 7, type: "Rook")
      rook.update_piece_location(1,7)

      expect(rook.valid_move?(0,7)).to be(true)
    end

    it "should return true if black king in check by white knight" do
      game = FactoryBot.create(:game)
      king = game.pieces.find_by(color: "black", type: "King")
      knight = game.pieces.find_by(color: "white", x_space: 6, y_space: 7, type: "Knight")
      knight.update_piece_location(6,1)

      expect(knight.valid_move?(4,0)).to be(true)
    end
  end
end
