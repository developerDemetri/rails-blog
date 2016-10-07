class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      session[:role] = user.role
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end

end
