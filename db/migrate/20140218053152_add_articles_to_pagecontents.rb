class AddArticlesToPagecontents < ActiveRecord::Migration
  def change
  	add_column :pagecontents, :article_title, :string
  	add_column :pagecontents, :article_description, :string
  	add_column :pagecontents, :article_link, :string
  end
end
