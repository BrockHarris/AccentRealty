module ApplicationHelper
	
	def nav_state(action_name)
    if params[:action] == action_name    
    	"nav_link_active"
  	else
  		"nav_link"
    end
	end

	def admin_nav_state(action_name)
    if params[:action] == action_name    
    	"list-group-item active"
  	else
  		"list-group-item"
    end
	end

  def convert_to_yesno(boolean)
    boolean ? 'Yes' : 'No'
  end
end
