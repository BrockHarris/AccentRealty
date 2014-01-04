class BlogpostsController < ApplicationController

  def index
    @results = Blogpost.search(params[:search])
  end
  
	def create
    @blogpost = Blogpost.new(params[:blogpost])
    if @blogpost.save
      redirect_to (:back)
      flash[:succcess] = "Your post has been published!"
    else
      flash[:error] = "Please make sure that the entire form is complete."
      redirect_to (:back)
    end
  end
end
