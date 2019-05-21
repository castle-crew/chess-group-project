class Pawn < Piece

  def valid_move?(x, y)
    if x != x_space
      return false
    end
    if y_space + 1 = y 
      return true
    end
    if y_space + 2 = y 
      if (y_space == 1 && color == "black") or (y_space == 6 && color == "white") 
        return true
      end
    end

    return false
  end
  
end
