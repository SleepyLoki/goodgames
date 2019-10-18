class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    @game.photos.create(photo_params.merge(user: current_user))
    redirect_to game_path(@game)
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
