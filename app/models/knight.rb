class Knight < Piece

  def valid_move?(x, y)
    if (x_space + 1 == x && y_space + 2 == y) || 
       (x_space - 1 == x && y_space + 2 == y) ||
       (x_space + 1 == x && y_space - 2 == y) ||
       (x_space - 1 == x && y_space - 2 == y) ||
       (y_space + 1 == y && x_space + 2 == x) ||
       (y_space - 1 == y && x_space + 2 == x) ||
       (y_space + 1 == y && x_space - 2 == x) ||
       (y_space - 1 == y && x_space - 2 == x)
      return true

    else
      return false
    end
  end
end