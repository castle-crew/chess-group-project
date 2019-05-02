class Piece < ApplicationRecord

  def self.types
    %w(King Knight Pawn Queen Rook)
  end

  scope :kings, -> { where(type: 'King') }
  scope :knights, -> { where(type: 'Knight') }
  scope :queens, -> { where(type: 'Queen') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :pawns, -> { where(type: 'Pawn') }

end
