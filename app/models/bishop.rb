class Bishop < Piece
  
   def valid_move?(x, y)
      if space_occupied?(x, y)
        return false if opposing_piece_at_location?(x, y) == false 
      end
      if legal_move?(x, y) == false
        return false
      else
        return true
      end
    end

  def legal_move?(x, y)
    if diagonal_move?(x, y) && !diagonal_obstruction?(x, y)
      return true
    else  
      return false
    end
  end
end
