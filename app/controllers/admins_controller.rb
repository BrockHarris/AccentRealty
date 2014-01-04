class AdminsController < ApplicationController
	
	def admin_start
		@hide_user_menu = true
		if admin_user
			redirect_to admin_dashboard_path
		else
			@new_admin = Admin.new
		end
	end

	def dashboard
		if Admin.find(:all).empty?
			@initial_setup = true
		end

		@hide_user_menu = true
		if admin_user
			@blogpost = Blogpost.new
			@blogposts = Blogpost.all
			@add_admin = Admin.new
			@add_user = User.new
			@skip_sign_in = true
			@show_admins = Admin.all
			@list_users = User.all
		else
			redirect_to root_path
		end
	end

	def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:notice] = "New administrator successfully created!"
      if @skip_sign_in
      	redirect_to (:back)
      else
      	sign_admin_in(@admin)
      end
    else
    	flash[:notice] = "There was a problem with the information you entered."
    	redirect_to (:back)
    end
  end
end
