class PagesController < ApplicationController

	def home
		@message = Message.new
	end

	def resources
	end
end
