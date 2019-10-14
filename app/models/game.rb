class Game < ApplicationRecord
  belongs_to :user
  has_many :cps
  has_many :photos

  def self.search(term)
    if term
      where('title iLIKE ?', "%#{term}%")
    else
      all
    end
  end
end
