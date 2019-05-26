class Piece < ApplicationRecord

  def self.types
    %w(King Knight Pawn Queen Rook)
  end

  scope :kings, -> { where(type: 'King') }
  scope :knights, -> { where(type: 'Knight') }
  scope :queens, -> { where(type: 'Queen') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :pawns, -> { where(type: 'Pawn') }
  
  def move_to!(x, y)
    return false unless valid_move?(x, y)
    if space_occupied?(x, y)
      return false unless opposing_piece_at_location?(x, y)
      capture!(x, y)
    end
  end

  def piece_at_location(x, y)
    game.pieces.find_by(x_space: x, y_space: y)
  end

  def opposing_piece_at_location?(x, y)
    space_occupied(x, y) && (piece_at_location(x, y).color != color)
  end

  def capture!(x, y)
    
  end




  end
