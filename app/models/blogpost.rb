class Blogpost < ActiveRecord::Base

	belongs_to :admin
  attr_accessible :title, :body, :admin_id, :category, :heading

  validates :title, :body, :category, :heading, :presence => true

  default_scope where("blogposts.deleted_at IS NULL")

  before_save :handle_formatting

  def handle_formatting
    unless category.blank?
      self.category.downcase
    end
  end

  def self.search(search)
  	if search
    	find(:all, :conditions => ['title || category LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
	end

  def destroy
    update_attribute(:deleted_at, Time.now.utc)
  end
end
