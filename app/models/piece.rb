class Piece < ApplicationRecord

  belongs_to :game
  
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
    game.pieces.find_by(x_position: x, y_position: y)
  end

  def opposing_piece_at_location?(x, y)
    space_occupied(x, y) && (piece_at_location(x, y).color != color)
  end

  def capture!(piece_at_location)
    update_attributes(x_position: nil, y_position: nil)
  end

  def space_occupied?(x, y)
    game.pieces.where('x_space = ? AND y_space = ?', x, y).present?
  end

  def vertical_move?(x, y)
    return true if x_space == x && y_space != y
  end

  def horizontal_move?(x, y)
    return true if x_space != x && y_space == y
  end

  def diagonal_move?(x, y)
    return true if (x_space - x).abs == (y_space - y).abs && (x_space != x)
  end

  
  def vertical_obstruction?(x, y)
    y_min = [y_space, y].min
    y_max = [y_space, y].max
    (y_min + 1...y_max - 1).each do |y_coord|
      return true if space_occupied?(x, y_coord)
    end
    false
  end

 
  def horizontal_obstruction?(x, y)
    x_min = [x_space, x].min
    x_max = [x_space, x].max
    (x_min + 1...x_max - 1).each do |x_coord|
      return true if space_occupied?(x_coord, y)
    end
    false
  end

 

  def diagonal_obstruction?(x, y)
    x_direction = x_space < x ? 1 : -1
    y_direction = y_space < y ? 1 : -1

    current_x = x_space + x_direction
    current_y = y_space + y_direction
    while current_x != x && current_y != y
      return true if space_occupied?(current_x, current_y)
      current_x += x_direction
      current_y += y_direction
    end
    false
  end

 
  def is_obstructed?(x, y)
    return vertical_obstruction?(x, y) if vertical_move?(x, y)
    return horizontal_obstruction?(x, y) if horizontal_move?(x, y)
    return diagonal_obstruction?(x, y) if diagonal_move?(x, y)
    false
  end
  
end
