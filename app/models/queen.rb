class Queen < Piece

  def valid_move?(x, y)
    if x_space == x && y_space == y
      return false
    end
    if (x - x_space).abs != (y - y_space).abs
      return false
    end

    return true
  end

end
