class Photo < ApplicationRecord
  belongs_to :game
  belongs_to :user  
  mount_uploader :picture, PictureUploader

  def picture_limit?(game)
    pictures_in_game = []
    game.photos.each do |photo|
      pictures_in_game << photo.picture
    end

    if pictures_in_game.length >= 10
      return true
    else
      return false
    end
  end
end
