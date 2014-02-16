class AdminsController < ApplicationController

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
		@blogpost = Blogpost.new
		@blogposts = Blogpost.all
		@skip_sign_in = true
		@show_admins = Admin.all
		@list_users = User.all
	end

	def users
		@new_admin = Admin.new
		@new_user = User.new
		@skip_sign_in = true
		@show_admins = Admin.all
		@list_users = User.all
	end

	def messages 
		@sent_messages = Message.where(:responded_to => true)
		@read_messages = Message.where(:read => true, :responded_to => false)
		@skip_sign_in = true
	end

	def questions
		@published_questions = Question.where(:published => true)
		@unpublished_questions = Question.where(:responded_to => true, :published => false)
		@skip_sign_in = true
	end

	def blogposts
		@blogpost = Blogpost.new
		@blogposts = Blogpost.all
	end

	def local_partners # page_type = 1 #
		@pagecontent = Pagecontent.new
		@pagecontents = Pagecontent.where(:page_type => 1)
	end

	def buyertips # page_type = 2 #
		@page_header = Pagecontent.where(:page_type => 2, :is_header => true).take(1)
		@pagecontent = Pagecontent.new
		@pagecontents = Pagecontent.where(:page_type => 2, :is_header => false)
	end

	def sellertips # page_type = 3 #
		@page_header = Pagecontent.where(:page_type => 3, :is_header => true).take(1)
		@pagecontent = Pagecontent.new
		@pagecontents = Pagecontent.where(:page_type => 3, :is_header => false)
	end

	def advice_admin # page_type = 4 #
		@pagecontent = Pagecontent.new
		@pagecontents = Pagecontent.where(:page_type => 4)
	end

	def evaluations
		@read_evaluations = Evaluation.where(:read => true)
	end

	def settings 
	end

	def update
		@admin = Admin.find(params[:id])
		respond_to do |format|
    	if @admin.update_attributes(params[:admin])
      	format.html { redirect_to((:back), :success => "Changes saved.") }
        format.json { respond_with_bip(@admin) }
    	else
    		format.html { redirect_to((:back), :error => "There was a problem with the information you entered.") }
        format.json { respond_with_bip(@admin) }
    	end
    end
  end

	def destroy
		@admin = Admin.find(params[:id])
		@admin.destroy
    flash[:notice] = "Administrator successfully removed."
    redirect_to admin_users_path
  end
end
