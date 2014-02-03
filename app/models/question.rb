class Question < ActiveRecord::Base
	attr_accessible :content, :email, :admin_id, :response, :category, :published, :responded_to
end
