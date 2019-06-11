class Game < ApplicationRecord
 has_many :players
 belongs_to :white_player, :class => "User", :foreign_key => white_player
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
    black_king = game.pieces.find_by(color: "black", type: "King")
    white_king = game.pieces.find_by(color: "white", type: "King")
    
    black_piece = game.pieces.where(color: "black")
    white_piece = game.pieces.where(color: "white")

    if color == "white"
      white_piece.each do |piece|
        if white_piece.pawns.valid_move?(black_king.x_space, black_king.y_space)||
         white_piece.queens.valid_move?(black_king.x_space, black_king.y_space) ||
         white_piece.rooks.valid_move?(black_king.x_space, black_king.y_space) ||
         white_piece.knights.valid_move?(black_king.x_space, black_king.y_space) ||
         white_piece.bishops.valid_move?(black_king.x_space, black_king.y_space) ||
         white_piece.kings.valid_move?(black_king.x_space, black_king.y_space)
          return true
        else
          return false
        end
      end
    end

    if color == "black"
      black_piece.each do |piece|
        if black_piece.pawns.valid_move?(white_king.x_space, white_king.y_space)||
         black_piece.queens.valid_move?(white_king.x_space, white_king.y_space) ||
         black_piece.rooks.valid_move?(white_king.x_space, white_king.y_space) ||
         black_piece.knights.valid_move?(white_king.x_space, white_king.y_space) ||
         black_piece.bishops.valid_move?(white_king.x_space, white_king.y_space) ||
         black_piece.kings.valid_move?(white_king.x_space, white_king.y_space)
          return true
        else
          return false
        end
      end
    end
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


