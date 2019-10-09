class GamesController < ApplicationController

  def search
    @games = Game.search(params[:term])
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def games_params
    params.require(:games).permit(:title, :platform, :developer, :publisher, :term)
  end
end
