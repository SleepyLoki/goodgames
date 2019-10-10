class CreateCps < ActiveRecord::Migration[5.2]
  def change
    create_table :cps do |t|
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end
    add_index :cps, [:user_id, :game_id]
    add_index :cps, :game_id
  end
end
