class Photo < ApplicationRecord
  belongs_to :game
  belongs_to :user
  
  mount_uploader :picture, PictureUploader
end
