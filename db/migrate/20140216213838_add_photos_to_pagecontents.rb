class AddPhotosToPagecontents < ActiveRecord::Migration
  def change
  	add_column :pagecontents, :photo_file_name, :string
  	add_column :pagecontents, :photo_file_type, :string
  	add_column :pagecontents, :photo_file_size, :integer

  	# Includes support for partners as well. #
  	add_column :pagecontents, :partner_name, :string
  	add_column :pagecontents, :partner_email, :string
  	add_column :pagecontents, :partner_phone, :string
  end
end
