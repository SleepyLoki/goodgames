class MyGamesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @games = current_user.games
  end
end
