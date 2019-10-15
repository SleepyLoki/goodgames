class CreateHps < ActiveRecord::Migration[5.2]
  def change
    create_table :hps do |t|
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end

    add_index :hps, [:user_id, :game_id]
    add_index :hps, :game_id
  end
end
