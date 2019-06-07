class Bishop < Piece
  
  def valid_move?(x, y)
    if space_occupied?(x, y)
      if opposing_piece_at_location?(x, y) 
        return true
      else
        return false
      end
    end 

    if diagonal_move?(x, y) && !diagonal_obstruction?(x, y) == false
      return true
    else
      return false
    end
  end
end
  