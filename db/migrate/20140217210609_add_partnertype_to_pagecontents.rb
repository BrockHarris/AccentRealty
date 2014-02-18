class AddPartnertypeToPagecontents < ActiveRecord::Migration
  def change
  	add_column :pagecontents, :partner_type, :string
  end
end
