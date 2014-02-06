class AdminsController < ApplicationController
	
	in_place_edit_for :admin, :username

	def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      if admin_user
      	flash[:success] = "New administrator successfully created."
      	redirect_to (:back)
      else
      	flash[:success] = "Welcome to the admin panel!"
      	sign_admin_in(@admin)
      end
    else
    	flash[:notice] = "There was a problem with the information you entered."
    	redirect_to (:back)
    end
  end

	def admin_start
		if Admin.find(:all).empty?
			@initial_setup = true
		end

		@hide_user_menu = true
		if admin_user
			redirect_to admin_settings_path
		else
			@new_admin = Admin.new
		end
	end

	def dashboard
		if admin_user
			@blogpost = Blogpost.new
			@blogposts = Blogpost.all
			@add_admin = Admin.new
			@add_user = User.new
			@skip_sign_in = true
			@show_admins = Admin.all
			@list_users = User.all
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def users
		if admin_user
			@admin = Admin.new
			@user = User.new
			@skip_sign_in = true
			@show_admins = Admin.all
			@list_users = User.all
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def messages 
		if admin_user
			@read_messages = Message.where(:read => true)
			@unread_messages = Message.where(:read => false)
			@skip_sign_in = true
		else
			redirect_to root_path
		end
	end

	def blogposts
		if admin_user
			@blogpost = Blogpost.new
			@blogposts = Blogpost.all
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def local_partners # page_type = 2 #
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 2)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end
	def buyertips # page_type = 3 #
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 3)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def sellertips # page_type = 4 #
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 4)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def advice_admin # page_type = 4 #
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 4)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def evaluations
		if admin_user
			@evaluations = Evaluation.all
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def settings 
		if admin_user
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def update
		@admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash[:success] = "Your account has been updated!"
      redirect_to (:back)
    else
      flash[:notice] = "There was a problem with the information you entered."
    	redirect_to (:back)
    end
  end

	def destroy
		@admin = Admin.find(params[:id])
		@admin.destroy
    flash[:notice] = "Administrator successfully removed."
    redirect_to admin_users_path
  end
end
