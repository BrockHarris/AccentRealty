class AdminsController < ApplicationController
	
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
		@hide_user_menu = true

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
		@hide_user_menu = true
		if admin_user
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

	def messages 
		@hide_user_menu = true
		if admin_user
			@read_messages = Message.where(:read => true)
			@unread_messages = Message.where(:read => false)
			@skip_sign_in = true
		else
			redirect_to root_path
		end
	end

	def blogposts
		@hide_user_menu = true
		if admin_user
			@blogpost = Blogpost.new
			@blogposts = Blogpost.all
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def about # page_type = 1 #
		@hide_user_menu = true
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 1)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def localpartners # page_type = 2 #
		@hide_user_menu = true
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 2)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end
	def buyertips # page_type = 3 #
		@hide_user_menu = true
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 3)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def sellertips # page_type = 4 #
		@hide_user_menu = true
		if admin_user
			@pagecontent = Pagecontent.new
			@pagecontents = Pagecontent.where(:page_type => 4)
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def evaluations
		@hide_user_menu = true

		if admin_user
			@evaluations = Evaluation.all
			@unread_messages = Message.where(:read => false)
		else
			redirect_to root_path
		end
	end

	def settings 
		@hide_user_menu = true
		if admin_user
			@unread_messages = Message.where(:read => false)
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

  def update
  	@admin = Admin.find(params[:id])
  	respond_to do |format|
    	if @admin.update_attributes(params[:admin])

    	else

    	end
  	end
	end

	def destroy
    Admin.find(@admin).destroy
    @admin = Admin.find(params[:id])
    flash[:notice] = "Administrator successfully removed."
    redirect_to(:back)
  end
end
