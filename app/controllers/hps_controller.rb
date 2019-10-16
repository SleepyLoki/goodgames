class HpsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.wtp?(current_game)
      wtp_to_destroy = Wtp.find_by(game_id: current_game, user_id: current_user)
      wtp_to_destroy.delete
    elsif current_user.cp?(current_game)
      cp_to_destroy = Cp.find_by(game_id: current_game, user_id: current_user)
      cp_to_destroy.delete
    end
    current_user.hps.create(game: current_game)
    redirect_to game_path(current_game)
  end

  def destroy
    hp_to_destroy = Hp.find_by(game_id: current_game, user_id: current_user)
    hp_to_destroy.delete
    redirect_to game_path(current_game)
  end

  private

  def current_game
    @current_game ||= Game.find(params[:game_id])
  end
end
