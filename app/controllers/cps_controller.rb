class CpsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.cps.create(game: current_game)
    redirect_to game_path(current_game)
  end

  def destroy
    @cp = current_user.cps.include?(@game)
    @cp.destroy
    redirect_to root_path
  end

  private

  def current_game
    @current_game ||= Game.find(params[:game_id])
  end
end
