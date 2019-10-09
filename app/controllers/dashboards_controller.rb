class DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @games = current_user.games
    @user = current_user
  end
end
