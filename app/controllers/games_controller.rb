class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(new_game_params)
    redirect_to game_path(@game)
  end

  def search
    @games = Game.search(params[:term])
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def new_game_params
    params.require(:game).permit(:title, :genre, :meta_score, :platform, :description, :developer, :publisher, :release_date, :esrb_rating, :youtubeLink)
  end

  def games_params
    params.require(:games).permit(:title, :platform, :developer, :publisher, :term)
  end
end
