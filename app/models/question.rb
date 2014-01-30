class Question < ActiveRecord::Base
	attr_accessible :content, :response, :category, :published, :responded_to
end
