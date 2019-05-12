class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :board_id
      t.integer :game_id
      t.integer :player_1
      t.integer :player_2
      t.timestamps
    end
  end
end
