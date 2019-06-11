class Game < ApplicationRecord
  has_many :players
  has_many :users
  has_many :pieces

  scope :available, -> { where('(white_player IS NULL AND black_player IS NOT NULL) OR (black_player IS NULL AND white_player IS NOT NULL)') }
  after_create :populate_board!

  def populate_board!

   # black pieces
    (0..7).each do |i|
      Pawn.create(game_id: id, x_space: i, y_space: 1, color: "black", status: true)
    end

    Rook.create(game_id: id, x_space: 0, y_space: 0, color: "black", status: true)
    Rook.create(game_id: id, x_space: 7, y_space: 0, color: "black", status: true)

    Knight.create(game_id: id, x_space: 1, y_space: 0, color: "black", status: true)
    Knight.create(game_id: id, x_space: 6, y_space: 0, color: "black", status: true)

    Bishop.create(game_id: id, x_space: 2, y_space: 0, color: "black", status: true)
    Bishop.create(game_id: id, x_space: 5, y_space: 0, color: "black", status: true)

    Queen.create(game_id: id, x_space: 3, y_space: 0, color: "black", status: true)
    King.create(game_id: id, x_space: 4, y_space: 0, color: "black", status: true)

    # white pieces
    (0..7).each do |i|
      Pawn.create(game_id: id, x_space: i, y_space: 6, color: "white", status: true)
    end

    Rook.create(game_id: id, x_space: 0, y_space: 7, color: "white", status: true)
    Rook.create(game_id: id, x_space: 7, y_space: 7, color: "white", status: true)

    Knight.create(game_id: id, x_space: 1, y_space: 7, color: "white", status: true)
    Knight.create(game_id: id, x_space: 6, y_space: 7, color: "white", status: true)

    Bishop.create(game_id: id, x_space: 2, y_space: 7, color: "white", status: true)
    Bishop.create(game_id: id, x_space: 5, y_space: 7, color: "white", status: true)

    Queen.create(game_id: id, x_space: 3, y_space: 7, color: "white", status: true)
    King.create(game_id: id, x_space: 4, y_space: 7, color: "white", status: true)
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

  def construct_king_potential_moves(king)

    potential_moves = [
      [king.x_space + 1, king.y_space],
      [king.x_space - 1, king.y_space],
      [king.x_space, king.y_space + 1],
      [king.x_space, king.y_space - 1],
      [king.x_space + 1, king.y_space + 1],
      [king.x_space - 1, king.y_space - 1],
      [king.x_space + 1, king.y_space - 1],
      [king.x_space - 1, king.y_space + 1]
      ]

    return potential_moves

  end

  def get_valid_moves(potential_moves, king, opposing_pieces)

    valid_move_arr = []

    potential_moves.each do |coordinate|
      if king.valid_move?(coordinate[0], coordinate[1])
        valid_move_arr.push(coordinate)
      end
    end
    valid_move_arr.each do |coordinate|
      opposing_pieces.each do |piece|
        if piece.valid_move?(coordinate[0], coordinate[1])
          valid_move_arr.delete(coordinate)
        end
      end
    end

    return valid_move_arr
  end

  def checkmate
    if check?("white")
      white_king = Piece.find(color: "white", game_id: id, type: "King")
      black_pieces = Piece.where(color: "black", game_id: id, status: true)

      potential_moves = construct_king_potential_moves(white_king)
      valid_move_arr = get_valid_moves(potential_moves, white_king, black_pieces)

      if valid_move_arr.length == 0
        return true
      end
      return false 
    end

    if check?("black")
      black_king = Piece.find(color: "black", game_id: id, type: "King")
      white_pieces = Piece.where(color: "white", game_id: id, status: true)

      potential_moves = construct_king_potential_moves(black_king)
      valid_move_arr = get_valid_moves(potential_moves, black_king, white_pieces)

      if valid_move_arr.length == 0
        return true
      end
      return false 
    end  
      
    return false  
  end


  def stalemate
    if !check?("white")
      white_king = Piece.find(color: "white", game_id: id, type: "King")
      black_pieces = Piece.where(color: "black", game_id: id, status: true)

      potential_moves = construct_king_potential_moves(white_king)
      valid_move_arr = get_valid_moves(potential_moves, white_king, black_pieces)

      if valid_move_arr.length == 0
        return true
      end
      return false
    end

    if !check?("black")
      black_king = Piece.find(color: "black", game_id: id, type: "King")
      white_pieces = Piece.where(color: "white", game_id: id, status: true)

      potential_moves = construct_king_potential_moves(black_king)
      valid_move_arr = get_valid_moves(potential_moves, black_king, white_pieces)

      if valid_move_arr.length == 0 
        return true
      end
      return false
    end

    return false
  end

end
