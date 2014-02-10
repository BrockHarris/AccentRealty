class BlogpostsController < ApplicationController

  def index
    @results = Blogpost.search(params[:search])
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end
  
	def create
    @blogpost = Blogpost.new(params[:blogpost])
    if @blogpost.save
      flash[:succcess] = "Your blog post has been published."
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(params[:blogpost])
      flash[:success] = "Your changes have be published."
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

  def destroy
    Blogpost.find(params[:id]).destroy
    flash[:notice] = "Blog post successfully deleted."
    redirect_to(:back)
  end
end
