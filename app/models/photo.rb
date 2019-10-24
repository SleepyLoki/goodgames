class Photo < ApplicationRecord
  belongs_to :game
  belongs_to :user  
  mount_uploader :picture, PictureUploader
  mount_uploader :feature_Photo, PictureUploader

  def feature_limit?(game)
    features_in_game = []
    game.photos.each do |photo|
      features_in_game << photo.feature_Photo
    end

    if features_in_game.length >= 1
      return true
    else
      return false
    end
  end

  def picture_added?(game)
    pics_in_game = []
    game.photos.each do |photo|
      pics_in_game << photo.picture
    end

    if pics_in_game.length >= 1
      return true
    else
      return false
    end
  end

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
