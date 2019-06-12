class Pawn < Piece

  def valid_move?(x, y)
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

  def can_promote?(y_space)
    @y_space = y_space
    if Pawn.present? && (y_space == 7 && color == "black")
      return true
    elsif Pawn.present? && (y_space == 0 && color == "white")
      return true
    else 
      return false 
    end 
  end 

  
 def promotion(params)
    x = params[:x_space].to_i
    y = params[:y_space].to_i
    type = params[:type]

    update_attributes(
      x_space: nil,
      y_space: nil,
      state: 'off-board')
    game.pieces.create(
      x_space: x,
      y_space: y,
      type: type,
      state: 'moved',
      color: "white","black",
      player_id: player_id
      )
  end
  
end
