class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :piece_id
      t.string :type
      t.string :color
      t.string :x_space
      t.string :y_space
      
      t.timestamps
    end
  end
end
