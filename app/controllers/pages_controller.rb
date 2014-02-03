class PagesController < ApplicationController

	def home
	end

	def about
	end
	
	def listings
	end

	def communities
		@hartford_communities = Community.where(:county => "Hartford")
		@tolland_communities = Community.where(:county => "Tolland")
		@middlesex_communities = Community.where(:county => "Middlesex")
		@litchfield_communities = Community.where(:county => "Litchfield")
	end

	def sample1 #sample listing view

	end

	def evaluate
		@evaluation = Evaluation.new
	end

	def contact
		@message = Message.new
	end

	def advice
		@question = Question.new
		@questions = Question.where(:responded_to => true, :published => true)
	end

	def resources
	end

	def localpartners
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
