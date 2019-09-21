class DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    if @current_user.games
      @games = @current_user.games
    end
  end
end
