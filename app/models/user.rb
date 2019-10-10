class User < ApplicationRecord
  has_many :games
  has_many :cps
  has_many :currently_playing, through: :cps, source: :game

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def cp?(game)
    return currently_playing.include?(game)
  end
end
