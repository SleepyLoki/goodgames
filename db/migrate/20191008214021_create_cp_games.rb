class CreateCpGames < ActiveRecord::Migration[5.2]
  def change
    create_table :cp_games do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
