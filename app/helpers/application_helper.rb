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

  def render_profile_pic(user, size=:size, opts={})
    if user.photo.exists?
      return image_tag user.photo.url(size)
    else
      
    end
  end

  def render_partner_logo(pagecontent, size=:size, opts={})
    if pagecontent.photo.exists?
      return image_tag pagecontent.photo.url(size)
    else
      if size = "thumb"
        image_tag "generic_logo.png", :size => "75x75", :class=>"generic_logo" 
      elsif size = "small"
        image_tag "generic_logo.png", :size => "75x75", :class=>"generic_logo"  
      elsif size = "medium"
        image_tag "generic_logo.png", :size => "100x100", :class=>"generic_logo" 
      elsif size = "large"
        image_tag "generic_logo.png", :size => "136x136", :class=>"generic_logo" 
      end
    end
  end

  def strip_url(url)
    url.sub!(/https\:\/\/www./, '') if url.include? "https://www."
    url.sub!(/http\:\/\/www./, '')  if url.include? "http://www."
    url.sub!(/www./, '')            if url.include? "www."

    return url
  end
end
