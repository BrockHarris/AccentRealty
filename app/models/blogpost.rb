class Blogpost < ActiveRecord::Base

	belongs_to :admin
  attr_accessible :title, :body, :admin_id, :category, :heading

  before_save { self.category = category.downcase }

  def self.search(search)
  	if search
    	find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
	end
end
