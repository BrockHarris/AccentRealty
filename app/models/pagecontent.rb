class Pagecontent < ActiveRecord::Base
  attr_accessible :page_type, :section_title, :section_body, :subsection_title, :subsection_body, :page_header, :is_header, :photo, 
  								:partner_name, :partner_email, :partner_phone, :partner_link, :partner_type, :article_description, :article_link,
                  :article_title, :auxint_1, :auxstring_1, :auxtext_1

  has_attached_file :photo,
                    :styles => {
                    :thumb => "50x50#",
                    :small=> "75x75#",
                    :medium=> "100x100#",
                    :large  => "136x136#" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "/:style/:id/:filename" 

  before_save :handle_formatting

  def handle_formatting
    unless partner_type.blank?
      self.partner_type.downcase
    end
    unless partner_email.blank?
    	self.partner_email.downcase
    end
  end
end