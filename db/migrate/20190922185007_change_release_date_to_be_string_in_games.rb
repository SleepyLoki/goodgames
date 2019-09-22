class ChangeReleaseDateToBeStringInGames < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :release_date, :string
  end
end
