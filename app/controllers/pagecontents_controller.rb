class PagecontentsController < ApplicationController

	def create
    @pagecontent = Pagecontent.new(params[:pagecontent])
    if @pagecontent.save
      flash[:success] = "Page content saved."
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

	def update
    @pagecontent = Pagecontent.find(params[:id])
    if @pagecontent.update_attributes(params[:pagecontent])
      flash[:success] = "Page content saved."
      redirect_to (:back)
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

  def destroy
    Pagecontent.find(params[:id]).destroy
    flash[:notice] = "Page content deleted."
    redirect_to (:back)
  end
end
