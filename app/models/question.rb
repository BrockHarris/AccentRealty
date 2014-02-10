class Question < ActiveRecord::Base
	attr_accessible :content, :email, :admin_id, :response, :category, :published, :responded_to
 
	validates :content, :category, :email, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }
end
