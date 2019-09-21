class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.decimal :meta_score
      t.string :platform
      t.string :description
      t.string :developer
      t.string :publisher
      t.integer :release_date
      t.string :esrb_rating
      t.integer :user_id
      t.timestamps
    end
    add_index :games, :user_id
  end
end
