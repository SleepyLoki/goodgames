class AddYoutubeLinkToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :YoutubeLink, :string
  end
end
