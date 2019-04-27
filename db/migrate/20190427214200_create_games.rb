class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :game_id
      t.integer :player_1
      t.integer :player_2
      t.integer :winner

      t.timestamps
    end
  end
end
