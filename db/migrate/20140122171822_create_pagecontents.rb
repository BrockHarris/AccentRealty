class CreatePagecontents < ActiveRecord::Migration
  def change
    create_table :pagecontents do |t|
    	t.integer  :page_type
      t.string   :section_title
      t.text     :section_body
      t.string   :subsection_title
      t.text     :subsection_body
      t.string   :page_header
      t.boolean  :is_header, :default=>false
      t.timestamps
    end
    add_index :pagecontents, :page_type
  end
end
