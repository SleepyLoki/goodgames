class Game < ApplicationRecord
  belongs_to :users

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
