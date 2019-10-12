class Game < ApplicationRecord
  belongs_to :user
  has_many :cps

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
