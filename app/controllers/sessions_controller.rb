class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:session][:login].downcase, params[:session][:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "You are now signed in."
      redirect_to settings_path
    else
      flash[:error] = "There was a problem with your email or password."
      redirect_to (:back)
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been signed out."
    redirect_to root_url
  end
end