class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :game_id
      t.integer :white_player
      t.integer :black_player
      t.integer :winner

      t.timestamps
    end
  end
end
