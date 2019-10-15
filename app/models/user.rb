class User < ApplicationRecord
  has_many :games
  has_many :photos
  has_many :comments
  has_many :cps
  has_many :wtps
  has_many :hps
  has_many :currently_playing, through: :cps, source: :game
  has_many :want_to_play, through: :wtps, source: :game
  has_many :have_played, through: :hps, source: :game

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def cp?(game)
    return currently_playing.include?(game)
  end

  def wtp?(game)
    return want_to_play.include?(game)
  end

  def hp?(game)
    return have_played.include?(game)
  end
end
