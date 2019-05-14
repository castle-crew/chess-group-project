class Game < ApplicationRecord
 has_many :players
 has_many :pieces

  scope :available, -> { where('(white_player IS NULL AND black_player IS NOT NULL) OR (black_player IS NULL AND white_player IS NOT NULL)') }

 def populate_board!
   # white pieces
   (0..7).each do |i|
     Pawn.create(game_id: id, x_space: i, y_space: 1, color: true)
   end
   Rook.create(game_id: id, x_space: 0, y_space: 0, color: true)
   Rook.create(game_id: id, x_space: 7, y_space: 0, color: true)

   Knight.create(game_id: id, x_space: 1, y_space: 0, color: true)
   Knight.create(game_id: id, x_space: 6, y_space: 0, color: true)

   Bishop.create(game_id: id, x_space: 2, y_space: 0, color: true)
   Bishop.create(game_id: id, x_space: 5, y_space: 0, color: true)

   Queen.create(game_id: id, x_space: 3, y_space: 0, color: true)
   King.create(game_id: id, x_space: 4, y_space: 0, color: true)

    # black pieces
     (0..7).each do |i|
       Pawn.create(game_id: id, x_space: i, y_space: 6, color: false)
     end
    Rook.create(game_id: id, x_space: 0, y_space: 7, color: false)
   Rook.create(game_id: id, x_space: 7, y_space: 7, color: false)

   Knight.create(game_id: id, x_space: 1, y_space: 7, color: false)
   Knight.create(game_id: id, x_space: 6, y_space: 7, color: false)

   Bishop.create(game_id: id, x_space: 2, y_space: 7, color: false)
   Bishop.create(game_id: id, x_space: 5, y_space: 7, color: false)

   Queen.create(game_id: id, x_space: 3, y_space: 7, color: false)
   King.create(game_id: id, x_space: 4, y_space: 7, color: false)
 end

end