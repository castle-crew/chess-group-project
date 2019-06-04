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

# def in_check? 
#   if @white_pawn.valid_move?(@black_king.x_space, @black_king.y_space) == true||
#   if @white_queen.valid_move?(@black_king.x_space, @black_king.y_space) == true ||
#   if @white_rook.valid_move?(@black_king.x_space, @black_king.y_space) == true ||    
#   if @white_bishop.valid_move?(@black_king.x_space, @black_king.y_space) == true ||
#   if @white_knight.valid_move?(@black_king.x_space, @black_king.y_space) == true ||
#   if @white_king.valid_move?(@black_king.x_space, @black_king.y_space) == true ||

#   if @black_pawn.valid_move?(@white_king.x_space, @white_king.y_space) == true||
#   if @black_queen.valid_move?(@white_king.x_space, @white_king.y_space) == true ||
#   if @black_rook.valid_move?(@white_king.x_space, @white_king.y_space) == true ||    
#   if @black_bishop.valid_move?(@white_king.x_space, @white_king.y_space) == true ||
#   if @black_knight.valid_move?(@white_king.x_space, @white_king.y_space) == true ||
#   if @black_king.valid_move?(@white_king.x_space, @white_king.y_space) == true ||
#     return true
#   else
#     return false
# end
# yes
# pawn, bishop, queen, rook, knight

# no?

  def check?(color)
    colors = kings.map { |piece| piece.color }
    black_king = colors.fetch(0)
    white_king = colors.fetch(1)
    white_piece = 
    piece.each do |piece|
      if white_piece.valid_move(black_king.x_space, black_king.y_space) 
      elsif black_piece.valid_move(white_king.x_space, white_king.y_space)
        return true
      else
        return false
      end
    end
  end
end

