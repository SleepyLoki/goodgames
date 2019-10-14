class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :game_id
      t.integer :user_id
      t.timestamps
    end

    add_index :photos, [:user_id, :game_id]
    add_index :photos, :game_id
  end
end
