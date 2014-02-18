class AddPartnerwebToPagecontents < ActiveRecord::Migration
  def change
  	add_column :pagecontents, :partner_link, :string
  end
end
