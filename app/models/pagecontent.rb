class Pagecontent < ActiveRecord::Base
  attr_accessible :page_type, :section_title, :section_body, :subsection_title, :subsection_body, :page_header, :is_header
end
