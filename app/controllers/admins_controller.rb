class AdminsController < ApplicationController
	
	def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:notice] = "New administrator successfully created!"
      sign_admin_in(@admin)
    else
    	flash[:notice] = "There was a problem with the information you entered."
    	redirect_to (:back)
    end
  end
end
