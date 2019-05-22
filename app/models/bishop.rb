class Bishop < Piece
  
   def valid_move?(x, y)
    
    if space_occupied?(x, y)
      return false if opposing_piece_at_location?(x, y) == false 
    end
    return false if legal_move?(x, y) == false
    true
  end

  def legal_move?(x, y)
    return true if diagonal_move?(x, y) && !diagonal_obstruction?(x, y)
    false
  end
end
