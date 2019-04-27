class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :user_id
      t.string :name
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
