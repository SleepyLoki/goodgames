class HpsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.hps.create(game: current_game)
    redirect_to game_path(current_game)
  end

  def destroy
    @hp = current_user.hps.include?(@game)
    @hp.destroy
    redirect_to root_path
  end

  private

  def current_game
    @current_game ||= Game.find(params[:game_id])
  end
end
