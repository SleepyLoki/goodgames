class UsersController < ApplicationController

  private

  def user_params
    params.require(:game).permit(game_ids: [])
  end
end
