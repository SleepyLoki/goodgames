class GamesController < ApplicationController
  def show
    @games = current_user.games
    @games = Game.search(params[:term])
  end

  private

  def games_params
    params.require(:games).permit(:title, :platform, :developer, :publisher, :term)
  end
end
