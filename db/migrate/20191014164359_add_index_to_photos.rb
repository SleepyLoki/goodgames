class AddIndexToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_index :photos, [:user_id, :game_id]
  end
end
