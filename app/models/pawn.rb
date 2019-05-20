class Pawn < Piece

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 4839d5c3ea1ef9d170443bbf22da7b55b34fce71
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

<<<<<<< HEAD
>>>>>>> 4839d5c3ea1ef9d170443bbf22da7b55b34fce71
=======
>>>>>>> 4839d5c3ea1ef9d170443bbf22da7b55b34fce71
end
