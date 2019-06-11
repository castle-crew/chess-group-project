class Queen < Piece

  def valid_move?(x, y)
    if x_space == x && y_space == y
      return false
    elsif diagonal_move?(x, y) == true
      return true 
    else
      return true
    end
  end
end
