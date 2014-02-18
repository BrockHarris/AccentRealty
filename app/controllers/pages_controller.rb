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
		@load_map_script = true
	end

	def evaluate
		@evaluation = Evaluation.new
	end

	def contact
		@message = Message.new
	end

	def advice
		@question = Question.new
		@questions = Question.where(:published => true)
	end

	def resources
		@buyer_header = Pagecontent.where(:page_type => 2, :is_header => true).take(1)
		@buyer_contents = Pagecontent.where(:page_type => 2, :is_header => false)
		
		@seller_header = Pagecontent.where(:page_type => 3, :is_header => true).take(1)
		@seller_contents = Pagecontent.where(:page_type => 3, :is_header => false)
	end

	def localpartners
		@page_header = Pagecontent.where(:page_type => 1, :is_header => true).take(1)
		@page_contents = Pagecontent.where(:page_type => 1, :is_header => false)
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
