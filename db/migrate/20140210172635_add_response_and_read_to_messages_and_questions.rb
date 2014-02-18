class AddResponseAndReadToMessagesAndQuestions < ActiveRecord::Migration
  def change
  	add_column :pagecontents, :photo_file_name, :string
  	add_column :pagecontents, :photo_file_type, :string
  	add_column :pagecontents, :photo_file_size, :integer
  end
end
