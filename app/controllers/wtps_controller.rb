class WtpsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.wtps.create(game: current_game)
    redirect_to game_path(current_game)
  end

  def destroy
    @wtp = current_user.wtps.include?(@game)
    @wtp.destroy
    redirect_to root_path
  end

  private

  def current_game
    @current_game ||= Game.find(params[:game_id])
  end
end
