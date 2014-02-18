class AddNewsletterToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :newsletter, :boolean,  :default=>false
  end
end
