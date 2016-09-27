class SessionsController < ApplicationController
  def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:role] = user.role
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end
    def destroy
      session[:user_id] = nil
      session[:role] = nil
      redirect_to '/login'
    end
end
