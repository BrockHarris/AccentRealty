class User < ActiveRecord::Base
  attr_accessible :email, :password, :mode, :password_confirmation, :firstname, :lastname, 
end
