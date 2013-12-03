class Blogpost < ActiveRecord::Base
  attr_accessible :title, :body, :admin_id
end
