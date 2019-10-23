class Game < ApplicationRecord
  belongs_to :user
  has_many :cps
  has_many :wtps
  has_many :hps
  has_many :photos
  has_many :comments

  validates :title, :genre, :meta_score, :platform, :description, :developer, :publisher, :esrb_rating, :youtubeLink, presence: true

  def self.search(term)
    if term
      where('title iLIKE ?', "%#{term}%")
    else
      all
    end
  end

  # Method gathered from Steven Zeiler
  # Gist: https://gist.github.com/stevenzeiler/5911947
  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
  end

  PLATFORMS = {
    'PS4': 'ps4',
    'XBOX ONE': 'xbox_one',
    'Nintendo Switch': 'nintendo_switch',
    'PC': 'pc',
    'Nintendo 3DS': 'nintendo_3ds',
    'XBOX 360': 'xbox_360',
    'PS3': 'ps3',
    'Mobile': 'mobile'
  }

  ESRB_RATINGS = {
    'E': 'r_e',
    'E 10+': 'r_e10',
    'T': 'r_t',
    'M 17+': 'r_m',
    'Ao 18+': 'r_ao',
    'RP': 'r_rp'
  }

  GENRES = {
    'Action': 'g_action',
    'Platformer': 'g_platformer',
    'Fighting': 'g_fighting',
    'Rhythm': 'g_rhythm',
    'Stealth': 'g_stealth',
    'Action-Adventure': 'g_action_adventure',
    'Survival Horror': 'g_survival_horror',
    'Metroidvania': 'g_metroidvania',
    'Adventure': 'g_adventure',
    'Role-Playing': 'g_role_playing',
    'MMORPG': 'g_mmorpg',
    'Simulation': 'g_simulation',
    'Strategy': 'g_strategy',
    'Sports': 'g_sports',
    'Racing': 'g_racing',
    'Indie': 'g_indie',
    'Mobile': 'g_mobile'
  }

  def humanized_platform
    PLATFORMS.invert[self.platform]
  end

  def humanized_ratings
    ESRB_RATINGS.invert[self.esrb_rating]
  end

  def humanized_genres
    GENRES.invert[self.genre]
  end

end
