class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :user_id
      t.string :name
      t.integer :wins
      t.integer :loses

      t.timestamps
    end
  end
end
