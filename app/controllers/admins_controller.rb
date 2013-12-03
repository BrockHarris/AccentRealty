class AdminsController < ApplicationController
	
	def admin_start
		if admin_user
			redirect_to dashboard_admin_path
		else
			@new_admin = Admin.new
		end
	end

	def dashboard
		if admin_user
			@blogpost = Blogpost.new
			@add_admin = Admin.new
			@skip_sign_in = true
			@show_admins = Admin.all
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
