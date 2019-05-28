class MoveCount < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :move_count, :integer
  end
end
