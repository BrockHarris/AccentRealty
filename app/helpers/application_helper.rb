module ApplicationHelper
	
	def nav_state(action_name)
    if params[:action] == action_name    
    	"nav_link_active"
  	else
  		"nav_link"
    end
	end
end
