class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.create(sign_up_params)
    redirect_to root_path
  end

  private

  # Modified Devise params for user login
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :password_confirmation)
  end
end