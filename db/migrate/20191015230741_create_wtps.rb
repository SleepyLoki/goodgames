class CreateWtps < ActiveRecord::Migration[5.2]
  def change
    create_table :wtps do |t|
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end

    add_index :wtps, [:user_id, :game_id]
    add_index :wtps, :game_id
  end
end
