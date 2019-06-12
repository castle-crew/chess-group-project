class King < Piece

  def valid_move?(x, y)
    if ( x_space + 1 == x or x_space - 1 == x or x == x_space ) && 
       ( y_space + 1 == y or y_space - 1 == y or y == y_space ) 
      if ( x == x_space && y == y_space)
        return false
      end
      return true
    end

    return false
  end

  def queenside_valid?(x, y)
    if x_space - 2 == x and
      move_count == nil and
      y_space == y 
      if color == "black"
        queenside_rook = Piece.find(x_space: 0, y_space: 0, type: "Rook", color: "black", move_count: nil)
        if queenside_rook != nil and
          !is_obstructed?(0, 0)
          return true
        end
      end
      if color == "white"
        queenside_rook = Piece.find(x_space: 0, y_space: 7, type: "Rook", color: "white", move_count: nil)
        if queenside_rook != nil and
          !is_obstructed?(0, 7)
          return true
        end
      end
    end
    
    return false
  end

  def kingside_valid?(x, y)
    if x_space + 2 == x and
      move_count == nil and
      y_space == y 
      if color == "black"
        kingside_rook = Piece.find(x_space: 7, y_space: 0, type: "Rook", color: "black", move_count: nil)
        if kingside_rook != nil and
          !is_obstructed?(7, 0)
          return true
        end
      end
      if color == "white"
        kingside_rook = Piece.find(x_space: 7, y_space: 7, type: "Rook", color: "white", move_count: nil)
        if kingside_rook != nil and
          !is_obstructed?(7, 7)
          return true
        end
      end
    end

    return false
  end

  def kingside(x)

    if color == "black"
      update_attributes(x_space: 6, y_space: 0)
      black_rook == Piece.find(x_space: 7, y_space: 0, type: "Rook", color: "black", move_count: nil)
      black_rook.update_attributes(x_space: 5, y_space: 0)
    end
    if color == "white"
      update_attributes(x_space: 6, y_space: 7)
      white_rook == Piece.find(x_space: 7, y_space: 7, type: "Rook", color: "white", move_count: nil)
      white_rook.update_attributes(x_space: 5, y_space: 7)
    end
  end

  def queenside(x)
    if color == "black"
      update_attributes(x_space: 2, y_space: 0)
      black_rook == Piece.find(x_space: 0, y_space: 0, type: "Rook", color: "white", move_count: nil)
      black_rook.update_attributes(x_space: 3, y_space: 0)
    end
    if color == "white"
      update_attributes(x_space: 2, y_space: 7)
      white_rook == Piece.find(x_space: 0, y_space: 7, type: "Rook", color: "white", move_count: nil)
      white_rook.update_attributes(x_space: 3, y_space: 7)
    end
  end

end
