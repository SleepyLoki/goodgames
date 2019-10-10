class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(new_game_params)
    redirect_to search_games_path(@game)
  end

  def search
    @games = Game.search(params[:term])
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def new_game_params
    params.require(:game).permit(:title, :genre, :meta_score, :platform, :description, :developer, :publisher, :release_date, :esrb_rating, :YoutubeLink)
  end

  def games_params
    params.require(:games).permit(:title, :platform, :developer, :publisher, :term)
  end
end
