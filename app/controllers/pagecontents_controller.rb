class PagecontentsController < ApplicationController

	def create
    @pagecontent = Pagecontent.new(params[:pagecontent])
    if @pagecontent.save
      redirect_to (:back)
      flash[:succcess] = "Page successfully updated."
    else
      flash[:error] = "Please make sure the entire form is complete."
      redirect_to (:back)
    end
  end

	def update
      if @pagecontent.update_attributes(params[:pagecontent])
        flash[:notice] = "Page successfully updated."
        redirect_to (:back)
      else
        flash[:error] = "Please make sure the entire form is complete."
        redirect_to (:back)
      end
  end

  def destroy
    @pagecontent = Pagecontent.find(params[:id])
    Pagecontent.find(@pagecontent).destroy
    flash[:notice] = "Page content successfully removed."
    redirect_to(:back)
  end
end
