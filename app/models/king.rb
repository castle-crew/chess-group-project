class King < Piece

  def valid_move?(x, y)
    if ( x_space + 1 == x or x_space - 1 == x or x == x_space ) && 
       ( y_space + 1 == y or y_space - 1 == y or y == y_space ) &&
       return true
    end
    
    return false
  end

end
