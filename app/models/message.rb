class Message < ActiveRecord::Base
  # This model is used to handle the contact form #

  attr_accessible :name, :email, :subject, :body, :read

  validates :name, :email, :subject, :body, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }
end
