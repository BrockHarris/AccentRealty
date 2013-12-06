class PagesController < ApplicationController

	def home
	end

	def listings
	end

	def contact
		@message = Message.new
	end

	def resources
	end

	def user_start
		if current_user
			redirect_to myaccount_path
		else
			@new_user = User.new
		end
	end

	def blog
		@blogposts = Blogpost.all
	end
end
