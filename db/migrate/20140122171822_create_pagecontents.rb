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
      t.string   :article_title
      t.string   :article_description
      t.string   :article_link
      t.string   :photo_file_name
      t.string   :photo_file_type
      t.integer  :photo_file_size
      t.string   :partner_name
      t.string   :partner_email
      t.string   :partner_phone
      t.string   :partner_link
      t.string   :partner_type
      t.integer  :auxint_1
      t.string   :auxstring_1
      t.text     :auxtext_1
      t.timestamps
    end
    add_index :pagecontents, :page_type
  end
end
