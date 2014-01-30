class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
    	t.string  :city
    	t.string  :county
    	t.text    :latitude
    	t.text    :longitude
      t.timestamps
    end
    add_index :communities, :county
  end
end
