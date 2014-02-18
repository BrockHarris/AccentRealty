class AdminsessionsController < ApplicationController

	def create
    admin = Admin.authenticate(params[:session][:login].downcase, params[:session][:password])
    if admin
      session[:admin_id] = admin.id
      flash[:success] = "You are now signed in as an administrator."
      redirect_to admin_settings_path
    else
      flash[:error] = "There was a problem with your username or password."
      redirect_to admin_login_path
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = "You've been signed out."
    redirect_to admin_login_path
  end
end
