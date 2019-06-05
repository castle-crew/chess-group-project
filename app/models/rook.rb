class Rook < Piece
  def valid_move?(x, y) 
    # where x or y and the new space location after move is done
    move_x = (x - x_space).abs
    move_y = (y - y_space).abs
      # rook cannot move diagonally, so move x and y cannot be equal
    if move_y == move_x
      #return false if they are equal because diagonals are not allowed
      puts "Cannot move diagonally"
      return false
      #check if move is on board
    end
    
    if x.between?(0,7) && y.between?(0,7)
      #if it is on board check if it's only moved on one axis
      if move_x > 0 && move_y == 0
        if horizontal_obstruction?(x,y)
        # it looks for horizontal obstruction
          return false
        else
          return true
        end
      end
    end
    if move_y > 0 && move_x == 0
      if vertical_obstruction?(x,y)
      # it looks for vertical obstruction 
        return false
      else
        return true
      end
    end
     return false
  end
end
