class Pawn < Piece

  def valid_move?(x, y)
    #En Passant Move 
    if (y_space == 4 && y_space + 1 == y && x_space + 1 == x && color == "black") ||
       (y_space == 4 && y_space + 1 == y && x_space - 1 == x && color == "black") ||
       (y_space == 3 && y_space - 1 == y && x_space + 1 == x && color == "white") ||
       (y_space == 3 && y_space - 1 == y && x_space - 1 == x && color == "white")
       return true
       
    if x != x_space
      return false
    end
    if y_space + 1 == y 
      return true
    end
    if y_space + 2 == y 
      if (y_space == 1 && color == "black") or (y_space == 6 && color == "white") 
        return true
      end
    end

    return false
  end
<<<<<<< HEAD
end
=======
  
end
>>>>>>> fc93c4176ebfbc21495fea944fa9eaef778fe98f
