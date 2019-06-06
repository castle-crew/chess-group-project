class Game < ApplicationRecord
 has_many :players
 has_many :users
 has_many :pieces

  scope :available, -> { where('(white_player IS NULL AND black_player IS NOT NULL) OR (black_player IS NULL AND white_player IS NOT NULL)') }
after_create :populate_board!

 def populate_board!
   # black pieces
   (0..7).each do |i|
     Pawn.create(game_id: id, x_space: i, y_space: 1, color: "black")
   end
   Rook.create(game_id: id, x_space: 0, y_space: 0, color: "black")
   Rook.create(game_id: id, x_space: 7, y_space: 0, color: "black")

   Knight.create(game_id: id, x_space: 1, y_space: 0, color: "black")
   Knight.create(game_id: id, x_space: 6, y_space: 0, color: "black")

   Bishop.create(game_id: id, x_space: 2, y_space: 0, color: "black")
   Bishop.create(game_id: id, x_space: 5, y_space: 0, color: "black")

   Queen.create(game_id: id, x_space: 3, y_space: 0, color: "black")
   King.create(game_id: id, x_space: 4, y_space: 0, color: "black")

    # white pieces
     (0..7).each do |i|
       Pawn.create(game_id: id, x_space: i, y_space: 6, color: "white")
     end
    Rook.create(game_id: id, x_space: 0, y_space: 7, color: "white")
   Rook.create(game_id: id, x_space: 7, y_space: 7, color: "white")

   Knight.create(game_id: id, x_space: 1, y_space: 7, color: "white")
   Knight.create(game_id: id, x_space: 6, y_space: 7, color: "white")

   Bishop.create(game_id: id, x_space: 2, y_space: 7, color: "white")
   Bishop.create(game_id: id, x_space: 5, y_space: 7, color: "white")

   Queen.create(game_id: id, x_space: 3, y_space: 7, color: "white")
   King.create(game_id: id, x_space: 4, y_space: 7, color: "white")
 end

  def check?(color)
    #this is a placeholder for real logic
    #TO BE IMPLEMENTED
    return false
  end

  def checkmate
    if check?("white")
      white_king = Piece.find(color: "white", game_id: id, type: "King")

      potential_move = [
        [white_king.x_space + 1, white_king.y_space],
        [white_king.x_space - 1, white_king.y_space],
        [white_king.x_space, white_king.y_space + 1],
        [white_king.x_space, white_king.y_space - 1],
        [white_king.x_space + 1, white_king.y_space + 1],
        [white_king.x_space - 1, white_king.y_space - 1],
        [white_king.x_space + 1, white_king.y_space - 1],
        [white_king.x_space - 1, white_king.y_space + 1]
        ]

      valid_move_arr = []

      black_pieces = Piece.where(color: "black", game_id: id, status: true)

      potential_move.each do |coordinate|
        if white_king.valid_move?(coordinate[0], coordinate[1])
          valid_move_arr.push(coordinate)
        end
      end
      valid_move_arr.each do |coordinate|
        black_pieces.each do |black_piece|
          if black_piece.valid_move?(coordinate[0], coordinate[1])
            valid_move_arr.delete(coordinate)
          end
        end
      end

      if valid_move_arr.length == 0
        return true
      end

      return false 
    end

    if check?("black")
      black_king = Piece.find(color: "black", game_id: id, type: "King")

      potential_move = [
        [black_king.x_space + 1, black_king.y_space],
        [black_king.x_space - 1, black_king.y_space],
        [black_king.x_space, black_king.y_space + 1],
        [black_king.x_space, black_king.y_space - 1],
        [black_king.x_space + 1, black_king.y_space + 1],
        [black_king.x_space - 1, black_king.y_space - 1],
        [black_king.x_space + 1, black_king.y_space - 1],
        [black_king.x_space - 1, black_king.y_space + 1]
        ]

      valid_move_arr = []

      white_pieces = Piece.where(color: "white", game_id: id, status: true)

      potential_move.each do |coordinate|
        if black_king.valid_move?(coordinate[0], coordinate[1])
          valid_move_arr.push(coordinate)
        end
      end
      valid_move_arr.each do |coordinate|
        white_pieces.each do |white_piece|
          if white_piece.valid_move?(coordinate[0], coordinate[1])
            valid_move_arr.delete(coordinate)
          end
        end
      end

      if valid_move_arr.length == 0
        return true
      end

      return false 
    end  
      
    return false  
  end

end