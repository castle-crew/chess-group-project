class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :piece_id
      t.string :type
      t.string :color
      t.integer :x_space
      t.integer :y_space
      t.boolean :status
      t.integer :game_id

      t.timestamps
    end
  end
end
