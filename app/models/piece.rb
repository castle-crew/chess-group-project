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
  return false unless valid_move(x, y)
  if space_occupied?(x, y)
    return false unless is_opponent?(space_occupied?)
    capture!(space_occupied?)
    update_attributes(x_position: x, y_position: y)
  end
end



end
