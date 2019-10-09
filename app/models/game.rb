class Game < ApplicationRecord
  has_many :cp_games
  has_many :users, :through => :cp_games

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
