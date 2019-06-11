require 'rails_helper'
<<<<<<< HEAD

RSpec.describe Game, type: :model do

  describe "Game creation" do
    it "should put pieces on the board" do
      @game = FactoryBot.create(:game)

      pieces = @game.pieces.count

      expect(pieces).to eq(32)
      # expect(@game).to have_attributes(:Piece => :King)
      # expect(:King).to have_attributes(:x_space => 4, :y_space => 0)
=======
require 'support/shared_examples_for_pieces.rb'

RSpec.describe Game, type: :model do

  describe "game#new" do
    it "should put pieces on the board" do
      game = FactoryBot.create(:game)
      pieces = game.pieces.count

      expect(pieces).to eq(32)
    end
  end

  describe "method check?(color)" do
    it "should successfully identify the king color" do
      game = FactoryBot.create(:game)
      white_king = game.pieces.find_by(color: "white", type: "King")
      black_king = game.pieces.find_by(color: "black", type: "King")

      expect(white_king).to have_attributes(:color => "white")
      expect(black_king).to have_attributes(:color => "black")
    end

    it "should know there are 2 kings on the board" do
      game = FactoryBot.create(:game)
      kings = game.pieces.kings.count

      expect(kings).to eq(2)
    end

    it "should detect the kings in the proper game" do
      game = FactoryBot.create(:game)
      white_king = game.pieces.find_by(type: "King", color: "white")
      black_king = game.pieces.find_by(type: "King", color: "black")

      expect(white_king.game_id).to eq(game.id)
      expect(black_king.game_id).to eq(game.id)
    end

    it "should detect the pawns in the proper game" do
      game = FactoryBot.create(:game)
      pawn = game.pieces.where(type: "Pawn")
      pawn_one = pawn[0]
      pawn_four = pawn[4]
      pawn_eleven = pawn[11]

      expect(pawn_one.game_id).to eq(game.id)
      expect(pawn_four.game_id).to eq(game.id)
      expect(pawn_eleven.game_id).to eq(game.id)

    end
    it "should return true if white king in check by black bishop" do
      game = FactoryBot.create(:game)
      white_king = game.pieces.find_by(color: "white", type: "King")
      black_bishop = game.pieces.where(color: "black", type: "Bishop")

      black_bishop_ONE = black_bishop[0]
      black_bishop_ONE.update(x_space: 3, y_space: 6)
      white_king.update(x_space: 4, y_space: 7)
      expect(black_bishop_ONE.valid_move?(4,7)).to be(true)

    end

    it "should return true if black king in check by white rook" do
      game = FactoryBot.create(:game)
      black_king = game.pieces.find_by(color: "black", type: "King")
      white_rook = game.pieces.where(color: "white", type: "Rook")
      white_rook_ONE = white_rook[0]

      white_rook_ONE.update(x_space: 0, y_space: 4) 
      black_king.update(x_space: 0, y_space: 7)

      expect(white_rook_ONE.valid_move?(0,7)).to be(true)
    end

    it "should return true if black king in check by white knight" do
      game = FactoryBot.create(:game)
      black_king = game.pieces.kings.find_by(color: "black", type: "King")
      black_king.update_piece_location(4,0)

      white_knight = game.pieces.where(color: "white", type: "Knight")
      white_knight_ONE = white_knight[0]
      white_knight_ONE.update(x_space: 2, y_space:1)
      
      expect(white_knight_ONE.valid_move?(4,0)).to be(true)
    end

    it "should return true if black king in check by white queen" do
      game = FactoryBot.create(:game)
      white_queen = game.pieces.find_by(color: "white", type: "Queen")
      white_queen.update(x_space: 0, y_space: 4)

      black_king = game.pieces.find_by(color: "black", type: "King")
      black_king.update(x_space: 0, y_space: 7)
   
      expect(white_queen.valid_move?(0,7)).to be(true)
    end

    it "should return true if black king in check by white bishop" do
      game = FactoryBot.create(:game)
      black_king = game.pieces.find_by(color: "black", type: "King")
      black_king.update(x_space: 4, y_space: 7)

      white_bishop = game.pieces.where(color: "white", type: "Bishop")
      white_bishop_ONE = white_bishop[0]
      white_bishop_ONE.update(x_space: 1, y_space:4) 

      expect(white_bishop_ONE.valid_move?(4,7)).to be(true)
>>>>>>> fc93c4176ebfbc21495fea944fa9eaef778fe98f
    end
  end
end
