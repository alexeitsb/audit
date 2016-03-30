class SessionsController < ApplicationController
  def new
  end

  def create
    if (user = User.find_by_username(params[:username])) && user.password == params[:password]
      session[:username] = user.username
      redirect_to root_path
    else
      flash.now[:alert] = "O usuário ou a senha está errada"
      render "new"
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_path
  end
end