class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer  :admin_id
    	t.text     :content
    	t.text     :response
    	t.string	 :category
      t.string   :email
    	t.boolean  :published, :default=>false
    	t.boolean  :responded_to, :default=>false
      t.timestamps
    end
    add_index :questions, :admin_id
    add_index :questions, :category
  end
end