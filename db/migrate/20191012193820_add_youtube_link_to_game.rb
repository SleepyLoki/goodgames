class AddYoutubeLinkToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :youtubeLink, :string
  end
end
