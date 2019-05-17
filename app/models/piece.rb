class Piece < ApplicationRecord

  def self.types
    %w(King Knight Pawn Queen Rook)
  end

  scope :kings, -> { where(type: 'King') }
  scope :knights, -> { where(type: 'Knight') }
  scope :queens, -> { where(type: 'Queen') }
  scope :rooks, -> { where(type: 'Rook') }
  scope :pawns, -> { where(type: 'Pawn') }

  def space_occupied?(x, y)
    game.pieces.where('x_position = ? AND y_position = ?', x, y).present?
  end

  def vertical_move?(x, y)
    return true if x_position == x && y_position != y
  end

  def horizontal_move?(x, y)
    return true if x_position != x && y_position == y
  end

  def diagonal_move?(x, y)
    return true if (x_position - x).abs == (y_position - y).abs && (x_position != x)
  end

  
  def vertical_obstruction?(x, y)
    y_min = [y_position, y].min
    y_max = [y_position, y].max
    (y_min + 1...y_max - 1).each do |y_coord|
      return true if space_occupied?(x, y_coord)
    end
    false
  end

 
  def horizontal_obstruction?(x, y)
    x_min = [x_position, x].min
    x_max = [x_position, x].max
    (x_min + 1...x_max - 1).each do |x_coord|
      return true if space_occupied?(x_coord, y)
    end
    false
  end

 

  def diagonal_obstruction?(x, y)
    x_direction = x_position < x ? 1 : -1
    y_direction = y_position < y ? 1 : -1

    current_x = x_position + x_direction
    current_y = y_position + y_direction
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
