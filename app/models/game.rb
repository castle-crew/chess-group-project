class Game < ApplicationRecord
   scope :available, -> { where('(white_player IS NULL AND black_player IS NOT NULL) OR (black_player IS NULL AND white_player IS NOT NULL)') }

   belongs_to :user
   has_many :players
   has_many :pieces
end
